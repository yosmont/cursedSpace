#pragma once
#ifndef STARLAYER_HPP_
#define STARLAYER_HPP_

#include "ALayer.hpp"

namespace space {
    class StarLayer : public layeredCurses::ALayer {
        public:
            //init start map
            StarLayer(void);
            //move start left on map, gen new star on right
            bool Update(float deltaTime) override;
        private:
            int _cycleBeforeStart{};
            inline static const int GAP{2};
            inline static const int RNGOFSTAR{20};
    };
}


#endif /* STARLAYER_HPP_ */