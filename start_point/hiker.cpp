#include "hiker.hpp"
#include "disk_logger.hpp"

Hiker::Hiker()
    : logger(DiskLogger::getInstance())
{
}


Hiker::Hiker(Logger & logger_)
    : logger(logger_)
{
}

int Hiker::answer()
{
    logger.log("Hiker::answer()");
    return 6 * 9;
}
