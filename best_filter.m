function [ p,word ] = best_filter( per )

[p,x] = min(per);

switch x
    case 1
        word = "Arithmetic Mean Filter";
    case 2
        word = "Geometric Mean Filter";
    case 3
        word = "Harmonic Mean Filter";
    case 4
        word = "Contraharmonic Mean Filter";
    case 5
        word = "Median Filter";
    case 6
        word = "Max Filtered Image";
    case 7
        word = "Min Filtered Image";
    case 8
        word = "Mid Filtered Image";
    case 9
        word = "Alpha-Trimmed Mean Filter";
end
