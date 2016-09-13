module UserAnswerHelper
  def answer_shuffler(question, answer_seq = nil)
    answer_seq ||= (1..4).to_a.shuffle.take(4).join("").to_i
    answer_array = Array.new
    answer_array = answer_seq.to_s.split('').map { |digit| digit.to_i }
    answers = Array.new
    answers[0] = set_answer(question, answer_array[0])
    answers[1] = set_answer(question, answer_array[1])
    answers[2] = set_answer(question, answer_array[2])
    answers[3] = set_answer(question, answer_array[3])
    answers
  end
  
  def answer_retriever(question, answer)
    case answer
    when 1
      return question.correct_answer
    when 2
      return question.a2
    when 3
      return question.a3
    when 4
      return question.a4
    end
  end
  
  private
  
    def set_answer(question, answer_no)
      case answer_no
      when 1
        return question.correct_answer
      when 2
        return question.a2
      when 3
        return question.a3
      when 4
        return question.a4
      end
    end
  
end
