json.user_name current_user.nickname
json.created_at @chat.created_at.strftime("%H:%M")
json.message @chat.message