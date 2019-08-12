module SR_FF( input S,R,clk,
		output reg Q,Qb);

wire wire_Q,wire_Qb;

assign wire_Qb=~wire_Q;

always @ (posedge clk)
begin
	if(S && !R)				// Set the present state output 'Q' to 1
		begin Q<=1; Qb<=~Qb; end
	else if(!S && R)			// Reset the present state output 'Q'to 0
		begin Q<=0; Qb<=~Qb; end
	else if(!S && !R)			// acts as memory :: holds previous value
		begin Q<=Q; Qb<=~Qb; end
	else
		begin Q<=0; Qb<=0; end	     	// represents Invalid condition
end
endmodule
