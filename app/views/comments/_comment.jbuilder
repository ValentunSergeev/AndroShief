json.author do
  json.name comment.user.name
  json.image comment.user.image
end

json.body comment.body
