#pragma once
#ifndef SPACESHIPLAYER_HPP_
#define SPACESHIPLAYER_HPP_

#include "ALayer.hpp"

namespace space {
    class SpaceshipLayer : public layeredCurses::ALayer {
        public:
            //draw spaceship
            SpaceshipLayer(void);
            //move spaceship
            bool Update(float deltaTime) override;
        private:
            int currentPosY{10};
            int currentPosX{10};
    };
}

#endif /* SPACESHIPLAYER_HPP_ */