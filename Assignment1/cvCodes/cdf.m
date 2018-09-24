function [cumulative_vector] = cdf ( Norm_InputIm_histogram )

cumulative_vector = zeros(256,1);
cumulsum = 0;
for i=1:size(Norm_InputIm_histogram)
	cumulsum = cumulsum + Norm_InputIm_histogram(i);
	cumulative_vector(i)= cumulsum;
end

figure, bar(cumulative_vector);