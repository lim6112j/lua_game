AI = {}
function AI:load()
  self.width = 20
  self.height = 200
  self.speed = 500
  self.x = love.graphics.getWidth() - 50
  self.y = love.graphics.getHeight() / 2 - self.height /2
end
function AI:update(dt)
  self.y = Ball.y - self.height /2 - self.speed * dt
end
function AI:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
