Ball = {}
function Ball:load()
  self.x = love.graphics.getWidth() /2
  self.y = love.graphics.getHeight() /2
  self.width = 10
  self.height = 10
  self.speed = 200
  self.xVel = -self.speed
  self.yVel = 0
end
function Ball:update(dt)
  self:move(dt)
  self:checkBoundaries()
end
function Ball:move(dt)
  self.x = self.x + self.xVel * dt
  self.y = self.y + self.yVel * dt
end
function Ball:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
function Ball:checkBoundaries()
  if self.x < 0 or self.x > love.graphics.getWidth() then
    self.x = love.graphics.getWidth() /2
    self.y = love.graphics.getHeight() /2
    self.xVel = -200
    self.yVel = 0
  end
end
function Ball:collide()
  if checkCollision(self, Player) then
    self.xVel = self.speed
    local middleBall = self.y + self.height/2
    local middlePlayer = Player.y + Player.height/2
    local collisionPosition = middleBall - middlePlayer
    self.yVel = collisionPosition * 5
  end
  if checkCollision(self, AI) then
    self.xVel = -self.speed
    local middleBall = self.y + self.height/2
    local middleAI = AI.y + AI.height/2
    local collisionPosition = middleBall - middleAI
    self.yVel = collisionPosition * 5
  end
  if self.y < 0 then
    self.y = 0
    self.yVel = -self.yVel
  elseif self.y > love.graphics.getHeight() then
    self.y = love.graphics.getHeight()
    self.yVel = -self.yVel
  end
end
