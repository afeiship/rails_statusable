# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# 清空数据
Post.delete_all

# 创建示例文章
Post.create!([
  {
    title: "Rails 入门指南",
    content: "Ruby on Rails 是一个强大的 Web 开发框架...",
  },
  {
    title: "PostgreSQL 数据库使用",
    content: "PostgreSQL 是一个功能强大的开源数据库...",
  }
])

puts "创建了 #{Post.count} 篇文章"