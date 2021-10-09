set Macchine;
set Materiali;
set Mesi;

param Disponibilita{Mesi, Materiali};
param Requisiti{Materiali, Macchine};
param Profitto{Macchine};
param Produzione{Macchine, Mesi};

var Quantity{Macchine, Mesi} integer;

maximize Total_Profit : sum{j in Macchine, k in Mesi} Profitto[j]*Quantity[j,k];

s.t. ConstrAvail {i in Materiali, k in Mesi}:
	sum{j in Macchine} Requisiti[i,j] * Quantity[j, k] <= Disponibilita[k,i];


s.t. ProduzioneMesi{j in Macchine, k in Mesi}:
		 Quantity[j, k] >= Produzione[j, k];