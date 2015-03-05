BEGIN { FS = "\t" }
{
	districts[$4] += 1
	if ($1 > 899) {
		good_schools[$4] += 1
	}
}
END {
	for (district in districts) {
		total_schools = districts[district]
		if (district in good_schools) {
			num_of_good_schools = good_schools[district]
		} else {
			num_of_good_schools = "0"
		}
		percent = num_of_good_schools / total_schools * 100
		printf("%3d%% (%2s of %3s) schools in %s district score above %d\n", percent, num_of_good_schools, total_schools, district, 899)
	}
}
