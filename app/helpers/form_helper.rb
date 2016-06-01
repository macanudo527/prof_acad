module FormHelper
  def setup_grouping(grouping)
    5.times { grouping.questions.build }

    grouping
  end
end