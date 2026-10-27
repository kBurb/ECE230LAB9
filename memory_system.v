module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output reg[7:0] memory
);

reg [7:0] data_demux [3:0];
reg store_demux [3:0];

wire [7:0] mem_out [3:0];

byte_memory bm0 (
    .data(data_demux[0]),
    .store(store_demux[0]),
    .memory(mem_out[0])
);

byte_memory bm1 (
    .data(data_demux[1]),
    .store(store_demux[1]),
    .memory(mem_out[1])
);

byte_memory bm2 (
    .data(data_demux[2]),
    .store(store_demux[2]),
    .memory(mem_out[2])
);
byte_memory bm3 (
    .data(data_demux[3]),
    .store(store_demux[3]),
    .memory(mem_out[3])
);

//DEMUX 1
always @(*) begin
    data_demux[0] = 8'b0; data_demux[1] = 8'b0;
    data_demux[2] = 8'b0; data_demux[3] = 8'b0;
    case(addr)
        2'b00: data_demux[0] = data; 
        2'b01: data_demux[1] = data; 
        2'b10: data_demux[2] = data; 
        2'b11: data_demux[3] = data; 
     endcase
end

//DEMUX 2
always @(*) begin
    store_demux[0] = 1'b0; store_demux[1] = 1'b0;
    store_demux[2] = 1'b0; store_demux[3] = 1'b0;
    case(addr)
        2'b00: store_demux[0] = store; 
        2'b01: store_demux[1] = store; 
        2'b10: store_demux[2] = store;
        2'b11: store_demux[3] = store;
     endcase
end



//MUX    
always @(*) begin
    case(addr)
        2'b00: memory = mem_out[0];
        2'b01: memory = mem_out[1];
        2'b10: memory = mem_out[2];
        2'b11: memory = mem_out[3];
        default: memory = 8'b0;
     endcase
end

endmodule