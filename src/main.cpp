#include <ncurses.h>
#include <random>
#include <ctime>
#include <signal.h>
#include <future>
#include <thread>
#include "StarLayer.hpp"
#include "SpaceshipLayer.hpp"
#include "LayeredScene.hpp"

std::promise<void> quit{};

void sighandler(int sig)
{
    (void)sig;
    quit.set_value();
}

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
    quit.get_future().wait();
    scene.Exit();
    endwin();
}