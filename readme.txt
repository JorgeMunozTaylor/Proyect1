//--

Para los relojs de las secciones del programa tomar en cuenta lo siguiente:

Para poner el tiempo en escala de ns:

`timescale 	1ns / 1ps


Para frecuencia de 1MHz (mux y demux)
#500 clk <= ~clk;

Para frecuencia de 250kHz (bit striping y de-bit striping)
#2000 clk <= ~clk;

Para frecuencia de 2MHz ( serie-paralelo y paralelo-serie)
#250 clk <= ~clk;