module LED_VERILOG(
/*** APB3 BUS INTERFACE ***/
input PCLK, // clock
input PRESERN, // system reset
input PSEL, // peripheral select
input PENABLE, // distinguishes access phase
output wire PREADY, // peripheral ready signal
output wire PSLVERR, // error signal
input PWRITE, // distinguishes read and write cycles
input [31:0] PADDR, // I/O address
input wire [31:0] PWDATA, // data from processor to I/O device (32 bits)
output reg [31:0] PRDATA, // data to processor from I/O device (32-bits)
/*** I/O PORTS DECLARATION ***/
output reg LED
);
assign PSLVERR = 0;
assign PREADY = 1;
reg [999:0]color;
reg [23:0]data_counter;
reg [7:0]bit_counter;
reg [6:0]pwm_counter;
reg write_in_progress;
// Initializing stuff
wire color_write = (PWRITE & PENABLE & PSEL & write_in_progress);
reg [1:0]write_status;
reg [3:0]num_LEDs = 8;

always @(posedge PCLK) begin
    // Check for positive edge on PENABLE to indicate that input data is ready
    write_status[1] <= write_status[0];
    write_status[0] <= PENABLE;
    write_in_progress <= ~write_status[1] | write_status[0];
    if(write_in_progress) begin
        // Restart data
        if (bit_counter > num_LEDs * 24) begin
            data_counter <= 0;
            bit_counter <= 0;
            write_in_progress <= 0;
        end
        // Reset code
        else if (data_counter >= 24125) begin
            LED <= 0;
        end


        // Write a single bit
        // 125 clock cycles per bit
        // Write a 1: high for 80 low for 45
        // Write a 0: high for 40 low for 85
        else begin
            if(pwm_counter >= 125) begin
                pwm_counter <= 0;
                bit_counter <= bit_counter + 1;
            end
            // Check if this bit should be written high or low
            else begin
                // Write a 1
                if (color[bit_counter]) begin
                    if (pwm_counter <= 80) 
                        LED <= 1;
                    else 
                        LED <=0;
                    pwm_counter <= pwm_counter + 1;
                end
                // Write a 0
                else begin 
                    if (pwm_counter <= 40) 
                        LED <= 1;
                    else 
                        LED <=0;
                    pwm_counter <= pwm_counter + 1;
                end
            end
        end
        data_counter <= data_counter + 1;

    // Pulse BS
    end
end

always @(posedge PCLK) begin
    if(color_write)begin
        case (PADDR[4:2])
            3'd0: color[23:0] <= PWDATA[23:0];   //0x40050000
            3'd1: color[47:24] <= PWDATA[23:0];  //0x40050004
            3'd2: color[71:48] <= PWDATA[23:0];  //0x40050008
            3'd3: color[95:72] <= PWDATA[23:0];  //0x4005000c
            3'd4: color[119:96] <= PWDATA[23:0]; //0x40050010
            3'd5: color[143:120] <= PWDATA[23:0]; //0x40050014
            3'd6: color[167:144] <= PWDATA[23:0]; //0x40050018
            3'd7: color[191:168] <= PWDATA[23:0]; //0x4005001c
        endcase
    end
end




endmodule

