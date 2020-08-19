class Category < ActiveHash::Base
  self.data = [
    { id: 1, category: '---' },
    { id: 2, category: '生活' },
    { id: 3, category: '仕事' },
    { id: 4, category: '人間関係' },
    { id: 5, category: 'その他' }
    ]
end
