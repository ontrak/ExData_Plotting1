if(!exists('d')) {
	h <- read.table('household_power_consumption.txt', nrows=1, header=F, sep =';', stringsAsFactors = F)
	d <- read.table(pipe("grep '^[1-2]/2/2007' household_power_consumption.txt"), header=F, sep=';', na.string='?', colClasses=c('character','character',rep('numeric',7)))
	colnames(d) <- unlist(h)
	t <- strptime(paste(d$Date, d$Time, sep=' '),'%d/%m/%Y %H:%M:%S')
}
png('plot3.png', width=480, height=480)
plot(t, d$Sub_metering_1, type='l', ylab='Energy sub metering')
lines(t, d$Sub_metering_2, type='l', col='red')
lines(t, d$Sub_metering_3, type='l', col='blue')
legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty=1, lwd=2.5, col=c('black','red','blue'))
dev.off()