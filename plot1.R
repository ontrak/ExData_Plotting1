if(!exists('d')) {
	h <- read.table('household_power_consumption.txt', nrows=1, header=F, sep =';', stringsAsFactors = F)
	d <- read.table(pipe("grep '^[1-2]/2/2007' household_power_consumption.txt"), header=F, sep=';', na.string='?', colClasses=c('character','character',rep('numeric',7)))
	colnames(d) <- unlist(h)
	t <- strptime(paste(d$Date, d$Time, sep=' '),'%d/%m/%Y %H:%M:%S')
}
png('plot1.png', width=480, height=480)
hist(d$Global_active_power, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)')
dev.off()