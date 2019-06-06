BEGIN	{   FS = ";"; 
	        RS = ";[\r\n]+";
	        count = 0;
            i = 0;
            flag = 1;
            print "digraph Diplomas {\n\tsize=\"31,41\";\n\tnode [fontname=\"helvetica\"];\n\tranksep=3.0;\n\tnodesep=2.0;\n\toverlap=\"false\";\n\tsplines=\"true\";" > "graph.dot";
	        print "-----------EXERCÍCIO 2----------";
        }

NR>1	{ 
            if ( $2 ~ /([0-9]+\.?)+/ ) { 
                count++; 
                print "Código: " $2 ";\nTítulo: " $3 ";\nDescrição: " $4 "\nNotas: ; "$5;
            }
            
            if( $8 ~ /(.+#)+/ ){
                print ("\t\"" $2 "\" [shape=box, style=filled, fillcolor=\"#8B95C9\", color=\"#8B95C9\"];" ) >> "graph.dot";
                split(substr($8, 2), array, /#"?(\r\n)*"?/);
                for(j = 1; array[j]; j++) {
                    print ("\t\"" array[j] "\" [style=filled, color=\"#E8DBC5\", fillcolor=\"#E8DBC5\"];") >> "graph.dot";
                    print ("\t\"" $2 "\"\t->\t\"" array[j] "\" [arrowsize=0.4, weight=0.1, color=\"#8B95C9\"];") >> "graph.dot";
                }
            }

            for(j=0 ; j < i ; j++){
                if(campo[j] == $10) {
                    valor[j]++;
                    flag=0;
                }
            }
            
            if(flag && $10){
                campo[i] = $10;
                valor[i++] = 1;
            }
 
            flag = 1;

        }



END	    {
            print "-----------EXERCÍCIO 3-------------";
            for(j=0;j<i ; j++) {
                printf "Tipo de Processo: ";
                printf campo[j]; 
                print " -> Número de ocorrências: " valor[j];
            }
            printf "}" >> "graph.dot";
            system("neato -Tpng graph.dot -o graph.png");
            system("eog graph.png");        
        }
