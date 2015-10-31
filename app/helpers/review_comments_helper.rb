=begin
   module ReviewCommentsHelper

     def self.construct_comments_table(comment_array)
       return "" unless comment_array.length > 0
       comment_window_html = "<table width='100%' cellpadding='3' style='table-layout: fixed; word-wrap: break-word;'>"
       for i in 0..(comment_array.length-1) do
         comment_window_html += "<tr><td><b>Comment #{i+1}:</b><br/>" +
           comment_array[i].to_s + "</td></tr>"
       end
       comment_window_html += "</table>"
       return comment_window_html
     end

   end
=end
module ReviewCommentsHelper

  def self.construct_comments_table(comment_array,comment_window,i,initial_line_number,final_line_number,authorflag,selectedFile)
    #return "" unless comment_array.length > 0

    #comment_window_html = "<table width='100%' cellpadding='3' style='table-layout: fixed; word-wrap: break-word;'>"
    comment_window_html = comment_window
    # for i in 0..(comment_array.length-1) do
    if initial_line_number == final_line_number
      comment_window_html += "<tr><td><hr><b>Comment for line #{initial_line_number + 1}:</b><br/><font color='blue'>" +
        comment_array            #New code---------

    else
      comment_window_html += "<tr><td><hr><b>Comment for lines #{initial_line_number + 1} - #{final_line_number + 1}:</b><br/><font color='blue'>" +
        comment_array            #New code---------
      end
    if authorflag == 0
      comment_window_html +=  "</font></td></tr>"
    else
      if "old" == selectedFile
        # comment_window_html += "<tr><td><hr><b>Comment for lines #{initial_line_number + 1} - #{final_line_number + 1}:</b><br/><font color='blue'>" +
        #    comment_array
        comment_window_html += "</font></td></tr>"
      else
        comment_window_html +=  "<br><br><a id ='#{i+1}' onclick=\"createButton('#{i}','#{initial_line_number}','#{final_line_number}')\"><b>Reply</b></a></td></tr>"
      end
    end
    # comment_window_html += "</table>"
    return comment_window_html
  end
end

