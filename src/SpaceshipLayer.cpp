#include "SpaceshipLayer.hpp"
#include <random>

/*
   __
   \ \_____
###[==_____>
   /_/ 
*/

const std::vector<std::vector<char>> spaceshipDrawing {
    {(char)-1, (char)-1, (char)-1, '_', '_'},
    {(char)-1, (char)-1, (char)-1, '\\', ' ', '\\', '_', '_', '_', '_', '_'},
    {'#', '#', '#', '[', '=', '=', '_', '_', '_', '_', '_', '>'},
    {(char)-1, (char)-1, (char)-1, '/', '_', '/'}
};

space::SpaceshipLayer::SpaceshipLayer(void):
    ALayer(5)
{
    DrawOnMap(spaceshipDrawing, currentPosY, currentPosX);
}

bool space::SpaceshipLayer::Update(float deltaTime)
{
    if (CheckTimer(deltaTime)) {
        if (currentPosY < 10)
            ++currentPosY;
        if (currentPosY > (LINES - 10))
            --currentPosY;
        else {
            if (std::rand() % 2)
                ++currentPosY;
            else
                --currentPosY;
        }
        ResetMap();
        DrawOnMap(spaceshipDrawing, currentPosY, currentPosX);
        return true;
    }
    return false;
}