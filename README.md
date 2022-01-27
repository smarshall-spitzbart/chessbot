# Image Processing System For Robotic Arm Playing Chess
Collaborated on a project enabling two separate robotic arms to autonomously play chess against one another. My image processing system is included within CorrectPosition.m, ProcessImageDisp.m, and ProcessImageRot.m. The remaining functions were written by other lab students.

In playing a chess game, each board position was referenced to a 3-D coordinate describing where each type of chess piece should reside on that square. Throughout a long game, pieces would tend to displace from their intended coordinates. Therefore, a need existed to continuously validate the proper positioning of pieces and correct for any position errors that arose throughout a game. My solution was to develop a computer vision system to achieve this.
