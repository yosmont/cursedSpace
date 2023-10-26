#include <ncurses.h>
#include <random>
#include <ctime>
#include "StarLayer.hpp"
#include "SpaceshipLayer.hpp"
#include "LayeredScene.hpp"

int main(int ac, char **av, char **env)
{
    (void)ac;
    (void)av;
    (void)env;
    std::srand(std::time(nullptr));
    initscr();
    layeredCurses::LayeredScene scene{std::vector<std::shared_ptr<layeredCurses::ALayer>>{
        std::make_shared<space::StarLayer>(),
        std::make_shared<space::SpaceshipLayer>()
    }};
    scene.SceneLoop();
    endwin();
}