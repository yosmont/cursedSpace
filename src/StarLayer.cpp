#include "StarLayer.hpp"
#include <ncurses.h>
#include <random>

space::StarLayer::StarLayer(void) : 
    ALayer(0.05)
{
    for (int i{0}; LINES > i; ++i)
        for (int j{0}; COLS > j; ++j)
            if (!((j % GAP) + (i % GAP)) && !(std::rand() % RNGOFSTAR))
                _map[i][j] = '*';
    _cycleBeforeStart = (COLS % GAP);
}

bool space::StarLayer::Update(float deltaTime)
{
    if (CheckTimer(deltaTime)) {
        for (int i{0}; LINES > i; ++i) {
            _map[i].erase(_map[i].begin());
            if (!(_cycleBeforeStart + (i % GAP)) && !(std::rand() % RNGOFSTAR))
                _map[i].push_back('*');
            else
                _map[i].push_back((char)-1);
        }
        if (!_cycleBeforeStart)
            _cycleBeforeStart = (COLS % GAP);
        else
            --_cycleBeforeStart;
        return true;
    }
    return false;
}