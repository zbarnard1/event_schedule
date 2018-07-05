module EventsHelper

  # difference of start time and midnight in seconds, converted to hours,
  # and then multiplied by the height in px of a 1-hr block, plus the height of the headers.
  def calc_position(start_time)
    (((start_time - start_time.beginning_of_day) / 3600 * 100) + 75).to_s + "px;"
  end

  def calc_height(start_time, end_time)
    ((end_time - start_time) / 3600 * 100).to_s + "px;"
  end

end
