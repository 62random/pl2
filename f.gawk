BEGIN	{        
        FS = ";"; 
	    RS = ";[\r\n]+";
	    flag = 0;
	 }

NR==1	{ 
        print $0; 
    }


NR>1	{
        flag = 0;
	    for (i = 1; i <= NF; i++) {
		    if($i) flag = 1;
	    }
	    
        if (flag) {
		    if(!$1)
			    print ("NIL" $0);
		    else
			    print $0;
	    }
    }

END	{ 
}
