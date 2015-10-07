class Question
	def self.all
		@@model
	end

	def self.default_model
		return {
			:"1" => {
				title: "What is ½ + ½ =",
				answers: [
					{
						title: "1",
						correct: true,
						next: :"2"
					},
					{
						title: "½",
						correct: false,
						next: :"1a"
					},
					{
						title: "0",
						correct: false,
						next: :"1a"
					},
					{
						title: "Not sure",
						correct: nil,
						next: :"1a"
					}
				]
			},
			:"2" => {
				title: "What is ½ + 1/3 =",
				answers: [
					{
						title: "2/6",
						correct: false,
						next: :"1a"
					},
					{
						title: "1/3",
						correct: false,
						next: :"1a"
					},
					{
						title: "5/6",
						correct: true,
						next: nil
					},
					{
						title: "2/5",
						correct: false,
						next: :"1a"
					}
				]
			},
			:"1a" => {
				title: "Have you ever eaten pizza?",
				answers: [
					{
						title: "Yes",
						correct: nil,
						next: :"1b"
					},
					{
						title: "No",
						correct: nil,
						next: :"1a1"
					}
				]
			},
			:"1a1" => {
				title: "Have you ever had a glass of water?",
				answers: [
					{
						title: "Yes",
						correct: nil,
						next: nil
					},
					{
						title: "No",
						correct: nil,
						next: nil
					}
				]
			},
			:"1b" => {
				title: "How many slices to a pizza pie?",
				# 2, 4, 6, 8
				answers: [
					{
						title: "2",
						correct: nil,
						next: nil
					},
					{
						title: "4",
						correct: nil,
						next: nil
					},
					{
						title: "6",
						correct: nil,
						next: nil
					},
					{
						title: "8",
						correct: true,
						next: nil
					}
				]
			}
		}
	end
	
	@@model = self.default_model
end