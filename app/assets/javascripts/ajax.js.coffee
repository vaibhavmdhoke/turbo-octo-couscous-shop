$(document).ready ->
  $('#save-reward-per-dollar').on 'click', ->
    value = $('#reward-value').val()
    console.log value
    $.ajax
      url: '/update_reward/'
      data: {reward_per_dollar: value}
      dataType: 'json'
      type: 'POST'
      success: (response) ->
        console.log(response)
        success_value = response.success
        if success_value
          $('#point-per-spent').html(value)
          alert(' Successfully Updated')
        else
          alert(' Error In Updation Updated')
