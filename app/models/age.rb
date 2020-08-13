class Age < ActiveHash::Base
  self.data = [
    { id: 1, age: '---' },
    { id: 2, age: '20才以下' },
    { id: 3, age: '20~30才' },
    { id: 4, age: '30~40才' },
    { id: 5, age: '40~50才' },
    { id: 6, age: '50~60才' },
    { id: 7, age: '60才以上' }
  ]
end
