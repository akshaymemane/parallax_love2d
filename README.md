# Love2D Parallax Library

A lightweight parallax scrolling library for [LÖVE](https://love2d.org/).

![Build Status](https://img.shields.io/badge/build-passing-brightgreen) ![Coverage Status](https://img.shields.io/badge/coverage-100%25-brightgreen)

This library simplifies the creation of parallax effects in Love2D games. It allows you to create multiple scrolling layers with configurable speeds and supports both horizontal and vertical parallax types.

## LÖVE Compatibility

Since the library uses LÖVE's graphical functions, and these may change from version to version, ensure that the library is compatible with your version of LÖVE.

- The current version of the library is compatible with **LÖVE 11.x** and above.

## Example Usage

```lua
local Parallax = require("Parallax")

local parallax

function love.load()
    local layers = {
        { path = "background.png", speed = 10, sequence = 1 },
        { path = "midground.png", speed = 30, sequence = 2 },
        { path = "foreground.png", speed = 50, sequence = 3 }
    }

    -- Initialize Parallax with layers and specify type (horizontal or vertical)
    parallax = Parallax:new(layers, "horizontal")
end

function love.update(dt)
    -- Update parallax layers
    parallax:update(dt, 1) -- You can adjust the scroll speed multiplier here
end

function love.draw()
    -- Render parallax layers
    parallax:renderParallax()
end
