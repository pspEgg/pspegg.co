#  single match
result = sampleString =~ /<svg (.*\n)+</svg>/

#  iteration
sampleString.scan(/<svg (.*\n)+</svg>/) {
	|x| print x
	print "\n"
}