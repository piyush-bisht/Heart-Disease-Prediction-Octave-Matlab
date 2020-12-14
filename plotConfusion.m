function plotConfusion(p,y)
    truepos=0;
    trueneg=0;
    falsepos=0;
    falseneg=0;
    

    for i=1:size(p,1)
        if(p(i)==y(i))
            if(p(i)==1)
                truepos++;
            else
                trueneg++;
            end   
        else
            if(p(i)==1)
                falsepos++;
            else
                falseneg++;
            end
        end
    end

    Precision_1=truepos/(truepos+falsepos);
    Recall_1=truepos/(truepos+falseneg);
    Support_1=(falseneg+truepos);
    F1_score_1=2*(Precision_1*Recall_1/(Precision_1+Recall_1));

    truepos=0;
    trueneg=0;
    falsepos=0;
    falseneg=0;
    

    for i=1:size(p,1)
        if(p(i)==y(i))
            if(p(i)==0)
                truepos++;
            else
                trueneg++;
            end   
        else
            if(p(i)==0)
                falsepos++;
            else
                falseneg++;
            end
        end
    end

    Precision_0=truepos/(truepos+falsepos);
    Recall_0=truepos/(truepos+falseneg);
    Support_0=(falseneg+truepos);
    F1_score_0=2*(Precision_0*Recall_0/(Precision_0+Recall_0));

    
    fprintf("--------------------------------------------------------------------------------------------------------------------\n");
    fprintf("\tClass\tPrecision\t\tRecall\t\t\tF1_Score\t\tSupport\n");
    fprintf(["\t0\t%f\t\t%f\t\t%f\t\t%d\n"],Precision_0,Recall_0,F1_score_0,Support_0);
    fprintf(["\t1\t%f\t\t%f\t\t%f\t\t%d\n"],Precision_1,Recall_1,F1_score_1,Support_1);
   
    fprintf("---------------------------------------------------------------------------------------------------------------------\n");

end