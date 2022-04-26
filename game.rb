require 'ruby2d'

set title: "Will's Tutorial 2D Ruby Game"
set width: 1200
set height: 1000

WALK_SPEED = 3

background = Image.new 'background.png'

hero = Sprite.new(
  'hero.png',
  time: 175,
  width: 256,
  height: 256,
  y: 675,
  clip_width: 256,
)

on :key_held do |event|
  case event.key
  when 'left'
    hero.play flip: :horizontal
    if hero.x <= 0
      hero.play flip: :horizontal
      hero.stop
    else
      hero.x -= WALK_SPEED
      background.x += WALK_SPEED
    end

  when 'right'
    hero.play
    if hero.x >= (background.width - Window.width)
      hero.stop
    else hero.x
      hero.x += WALK_SPEED
      background.x -= WALK_SPEED
    end
  end
end

on :key_up do
  hero.stop
end

show
