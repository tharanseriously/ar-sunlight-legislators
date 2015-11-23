require_relative '../app/models/legislator'

class Queries
	def listall
		legislators = Legislator.all
		puts "Senators: "
		legislators.each do |x|
			puts "#{x.title} #{x.firstname} #{x.lastname} (#{x.party})"  if x.title = 'Sen'
		end

		puts "Representatives: "
		legislators.each do |x|
			puts "#{x.title} #{x.firstname} #{x.lastname} (#{x.party})" if x.title = 'Rep'
		end
	end

	def pergender(sex)
		legislators = Legislator.where(gender: sex, in_office: 1)
		senators = Legislator.where(title: 'Sen', in_office: 1)
		representatives = Legislator.where(title: 'Rep', in_office: 1)

		if sex == 'M'
			num1 = []
			num2 = []
			legislators.each do |x|
				if x.title == 'Rep'
					num1 << x
				elsif x.title == 'Sen'
					num2 << x
				end 
			end
			reppercent = (num1.length * 100/ representatives.length)
			senpercent = (num2.length * 100/ senators.length)
			puts "Male Representatives #{num1.length} #{reppercent}%" 
			puts "Male Senators #{num2.length} #{senpercent}%"
		elsif sex == 'F'
			num1 = []
			num2 = []
			legislators.each do |x|

				if x.title == 'Rep'
					num1 << x
				elsif x.title == 'Sen'
					num2 << x
				end
			end
			reppercent = (num1.length.to_f * 100/ representatives.length.to_f).ceil
			senpercent = (num2.length * 100/ senators.length)
			puts "Female Representatives #{num1.length} #{reppercent}%" 
			puts "Female Senators #{num2.length} #{senpercent}%"
		end
	end
end

query = Queries.new

method = ARGV[0]
case
when method == "listall"
	query.listall
when method == "pergender"
	query.pergender(ARGV[1])	
end