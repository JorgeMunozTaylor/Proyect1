//*******************************
//         Parametros
//*******************************

`timescale 1ns/1ps

//*******************************
//      Archivos a incluir
//*******************************
`ifndef MUX_V
    `define MUX_V
    `include "mux/mux.v"
`endif

`ifndef BYTE_STRIPING_V
    `define BYTE_STRIPING_V
    `include "byte_striping/byte_striping.v"
`endif

`ifndef SERIALIZADOR_V
    `define SERIALIZADOR_V
    `include "serdes/SerializadorUv.v"
`endif

`ifndef DESERIALIZADOR_V
    `define DESERIALIZADOR_V
    `include "serdes/Deserializador.v"
`endif

`ifndef BYTE_UNSTRIPING_V
    `define BYTE_UNSTRIPING_V
    `include "byte_striping/byte_unstriping.v"
`endif

`ifndef DEMUX_V
    `define DEMUX_V
    `include "demux/demux.v"
`endif

`ifndef PHY_V
    `define PHY_V
    `include "PHY.v"
`endif

`ifndef TEST_V
    `define TEST_V
    `include "test.v"
`endif