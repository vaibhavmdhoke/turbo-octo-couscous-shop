$(document).ready ->
  $('#saveRewardPerDollar').on 'click', ->
    value = $('#reward_value').val()
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
          alert(' Successfully Updated')
        else
          alert(' Error In Updation Updated')
