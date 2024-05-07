#import "../notebookinator/lib.typ": *
#import themes.radial: radial-theme, components, colors
#import colors: *

#show: notebook.with(theme: radial-theme, title: "5839B's Programming Notebook", team-name: "5839B", season: "Water Game", year: "2024-2025")

#create-frontmatter-entry(
  title: "Table of Contents",
)[
  #components.toc()
]

#create-body-entry(
  title: "First Steps",
  type: "identify",
  date: datetime(year: 2024, month: 3, day: 5),
  author: "Praful Adiga",
  witness: "Brandon Lewis",
)[
  = Post Season Notes
  With the end of the Over Under season, sadly we didn't make it to worlds, we evaluated our progress and decided that we need a better programming library. My job as the coder is to record and create a programming library that serves all our needs for the improved robot.

  In the Over Under season we didn't get all of the systems we wanted running working in time for the competition, for the autonomous we used PROS with both the OkapiLib library and the LemLib library, however each of those had its own shortcomings, so we decided to create our own library.

  But first, we had to decide which library to build off of, the following decision matrix shows our considerations and our decision
  
  #components.decision-matrix(
    properties: (
      (name: "Time to Develop", weight: 2),
      (name: "Extendable", weight: 2),
      (name: "Working Subsystems", weight: 1.5),
      (name: "Experience With Library", weight: 1),
      (name: "Future Proof", weight: 0.75),
      (name: "Code Readability", weight: 0.5),
    ), 
    ("PROS",     1, 5, 1, 4, 4, 1),
    ("OkapiLib", 4, 4, 3, 4, 4, 3),
    ("LemLib",   2, 3, 4, 2, 1, 1),
  )

  #components.admonition(type: "note")[
    OkapiLib had the following Subsystems:
     - Odometry (Centered Forward Pods)
     - Solid Base Classes
     - X-Drive Model
     - PID
    LemLib has the following Subsystems:
     - Odometry (flexible placement)
     - Pure Pursuit
     - No other drivetrain functions worked
     - PID not working
     - Asset (_useful_ utility)
  ]

  #components.admonition(type: "decision")[
    We decided to build the library of of OkapiLib in the end, as it has more flexibility, and a solid codebase, while taking inspiration from LemLib
  ]

  = Necessary Components

  We have limited time to develop the library, as our schoolwork and jobs eat into the development time, so we have made a ongoing list, shown below, that shows all the features we need in the library along with a short explanation of the feature, a longer explanation will be given in a dedicated section of the notebook

   - *Mecanum Drivetrain Model* - Although OkapiLib has an X-drive model, it doesn't have a Mechanum drive model, which has slightly different kinematics
   - *Boosted Mecanum Wheel Model* - Since out robot not only has a 4 motor mechanum drivetrain, the drivetrain also includes 2 separately powered omni-wheels to help boost forward torque
   - *Custom Odometry* - Although OkapiLib already has odometry, our design places all of the odometry pods in a straight line with the 2 forward facing wheels not being centered, OkapiLib doesn't support this so we need to create a custom odometry class for this, however this should be fairly straightforward
   - *PID and other Control Loops* - this will allow us to have fast and accurate movements
   - *Filtering Algorithms* - this will allow us to read more accurate readings by using previous values to validate and estimate a more accurate sensor reading
   - *Pure Pursuit* - Pure Pursuit is an algorithm that allows the robot to follow paths smoothly, even with disturbances, which is necessary for a fast and accurate autonomous period
   - *Asset* - this is a helpful utility from LemLib that would be very helpful in creating Pure Pursuit paths, as it allows the coder to not have to remove and reinsert the SD card every time a path is updated
   - *GUI* - this is necessary as it allows us to live tune variables, for example, we can create a PID tuner so we don't have to recompile after changing a single variable, this will speed up tuning by a significant amount as half the time it takes to to tune PID is spent waiting for code to compile. This will also help out robot look cleaner as a build

  #components.admonition(type: "goal")[
    Our goal is to finish most ( > 95% ) of the library before _*September 10, 2024*_

    This will allow us to have a reasonable amount of time to actually create the autonomous and any other functions that come up while doing so
  ]

  #components.gantt-chart(
    start: datetime(year: 2024, month: 3, day: 5),
    end: datetime(year: 2024, month: 9, day: 10),
    date-interval: 30,
    date-format: "[month]/[day]",
    tasks: (
      ("Plan", (1/30, 2/30)),
      ("Odometry", (2/30, 6/30)),
      ("Kalman Filtering", (6/30, 10/30)),
      ("Mecanum Drive", (10/30, 14/30)),
      ("PID", (14/30, 18/30)),
      ("Design GUI", (18/30, 20/30)),
      ("GUI", (20/30, 32/30)),
      ("Pure Pursuit", (32/30, 42/30)),
      ("Test/Fix Odometry", (42/30, 56/30)),
      ("Test/Fix Filtering", (56/30, 70/30)),
      ("Test/Fix Mecanum", (70/30, 75/30)),
      ("Test/Fix PID", (75/30, 84/30)),
      ("Test/Fix Pure Pursuit", (84/30, 98/30)),
      ("Integrate GUI", (98/30, 112/30)),
      ("Setup Field", (102/30, 105/30)),
      ("Fix Any Problems", (112/30, 206/30)),
      ("Create Match Route", (112/30, 120/30)),
      ("Test Match Route", (120/30, 140/30)),
      ("Create Skills Route", (140/30, 148/30)),
      ("Test Skills Route", (148/30, 168/30)),
      ("Create Drive Code", (168/30, 175/30)),
      ("Practice", (175/30, 206/30)),
      ("Move Field to School", (206/30, 210/30))
    ),
    goals: (
      ("New Game Reveal", 83/30),
      ("Summer Vacation Starts", 102/30),
      ("Summer Vacation Ends", 205/30),
    )
  )
]

#create-body-entry(
  title: "Library Structure",
  type: "identify",
  date: datetime(year: 2024, month: 3, day: 8),
  author: "Praful Adiga",
  witness: "Brandon Lewis"
)[
  Using proper C++ coding styles is a must in a project of this size, so we need a consistent and readable file structure which the following diagram will show

  ```
    include/
    ├─ lib5839/
    │  ├─ robot/
    │  │  ├─ flywheel.hpp
    │  │  ├─ catapult.hpp
    │  │  ├─ lift.hpp
    │  │  ├─ wings.hpp
    │  │  ├─ PTO.hpp
    │  ├─ chassis/
    │  │  ├─ controller/
    │  │  │  ├─ purePursuitController.hpp
    │  │  │  ├─ purePursuitControllerPID.hpp
    │  │  ├─ model/
    │  │  │  ├─ mecanumDriveModel.hpp
    │  │  │  ├─ boostedMecanumDriveModel.hpp
    │  │  │  ├─ threeEncoderMecanumDriveModel.hpp
    │  │  │  ├─ threeEncoderBoostedMecanumDriveModel.hpp
    │  ├─ odometry/
    │  │  ├─ trackingPod.hpp
    │  │  ├─ threeWheelOdometry.hpp
    │  ├─ GUI/
    │  │  ├─ odomDebugGUI.hpp
    │  │  ├─ PIDTunerGUI.hpp
    │  ├─ utils/
    │  │  ├─ filtering.hpp
    │  │  ├─ odomMath.hpp
    │  │  ├─ asset.hpp
    │  ├─ api.hpp
    ├─ liblvgl/
    │  ├─ ...
    ├─ okapi/
    │  ├─ ...
    ├─ pros/
    │  ├─ ...
    ├─ api.h
    ├─ main.hx
    ├─ globals.hpp
    ├─ gui.hpp
  src/
    ├─ lib5839/
    │  ├─ robot/
    │  │  ├─ flywheel.cpp
    │  │  ├─ catapult.cpp
    │  │  ├─ lift.cpp
    │  │  ├─ wings.cpp
    │  │  ├─ PTO.cpp
    │  ├─ chassis/
    │  │  ├─ controller/
    │  │  │  ├─ purePursuitController.cpp
    │  │  │  ├─ purePursuitControllerPID.cpp
    │  │  ├─ model/
    │  │  │  ├─ mecanumDriveModel.cpp
    │  │  │  ├─ boostedMecanumDriveModel.cpp
    │  ├─ odometry/
    │  │  ├─ trackingPod.cpp
    │  │  ├─ threeWheelOdometry.cpp
    │  ├─ GUI/
    │  │  ├─ odomDebugGUI.cpp
    │  │  ├─ PIDTunerGUI.cpp
    │  ├─ utils/
    │  │  ├─ odomMath.cpp
    ├─ main.cpp
    ├─ globals.cpp
    ├─ gui.cpp
  static/
    ├─ path.txt
  ```
]

#create-body-entry(
  title: "Asset and TrackingPod Classes",
  type: "program",
  date: datetime(year: 2024, month: 3, day: 8),
  author: "Praful Adiga",
  witness: "Brandon Lewis"
)[
  = Asset Class
  The asset class is a useful utility that originated from the LemLib library. It is a compile time function and accesability class that compiles any files in the static folder and sends them to the brain while still allowing c++ functions to have access to the contents of the file, this allows us to not have to take out the SD card that would have stored the static files, find and use a SD card reader to upload files to the SD card, and then insert the SD back into the brain every time we change or add a static file. Static files being files that aren't evaluated during runtime, they are read by the program to get large blocks of information.
  
  This is especially helpful when creating the GUI and Pure Pursuit Subsystems as both of those require static files. The Pure Pursuit requires a text file containing the path, which will be explained more in a future entry, and the GUI requiring images to display.

  #components.admonition(type: "implementation")[
    Stores:
     - the whole file as a string
     - the length of the file
    Can Return:
     - the file converted to many file types
     - the file split by a delimitator
  ]

  = TrackingPod Class
  The TrackingPod class is part of the Odometry system, it stores information on where it is located relative to the tracking center of the robot, and have helpful functions that convert encoder ticks to distance traveled.

  #components.admonition(type: "note")[
    This class is not compatible with the chassisScales class used in the OkapiLib's odometry base class, so there will be some challanges with this.
  ]

  #components.admonition(type: "implementation")[
    Stores: 
     - diameter of tracking wheel 
     - distance to tracking center 
     - reference to encoder (to get the absolute position of the sensor) 
     - gear ratio (default: 1) 
    Can Return:
     - distance traveled since last reset 
  ]

]

#create-body-entry(
  title: "Odometry Class",
  type: "program",
  date: datetime(year: 2024, month: 3, day: 9),
  author: "Praful Adiga",
  witness: "Brandon Lewis"
)[
  = Explanation
  Odometry, also known as Dead Reckoning, is a way for a robot to know it's global position, by using, at minimum, 2 encoders parallel to each other, a third encoder perpendicular to the other two can allow the robot to also track horizonal movement.

  Knowing the global position of the robot is useful as it allows the robot to self correct if it is disturbed by a game element or other robot. It also allows the robot to be able to use the pure pursuit algorithm, which will be explained in a later entry

  This is done by taking the amount each encoder changed by each frame and using some math to convert that into how much the robot has moved and turned in the x and y direction.

  #figure(
    rect(fill: black.lighten(10%))[
      #image("img\OdomDiagram.png", width: 80%)
    ],
    caption: [
      @odomDiagram: A simple case of the robot turning while moving forward
    ]
  ) <odomDiagram>

  @odomDiagram shows how when the robot moves, the wheels make 2 arcs that can then be used to calculate the radius of the turn and the distance traveled in each direction with the equations below. See Appendix A for a derivation of the equations

  #components.admonition(type: "equation")[
    $Delta L$: the distance the left encoder wheel moved since the last tick (inches)  

    $Delta R$: the distance the right encoder wheel moved since the last tick (inches)  
    
    $Delta S$: the distance the back encoder wheel moved since the last tick (inches)  

    $s_L$: the distance from the tracking center to the left encoder wheel (inches)  

    $s_R$: the distance from the tracking center to the right encoder wheel (inches)  
    
    $s_S$: the distance from the tracking center to the back encoder wheel (inches)  
    
    $Delta theta$: the change in heading (radians)  

    $Delta attach(limits(d), t: ->, br: l)$: the translation vector in the local coordinate system (inches)
    
    $ Delta theta = (Delta L - Delta R) / (s_L - s_R) $
    $ Delta attach(limits(d), t: ->, br: l) = 2 sin(theta/2) * vec((Delta S)/(Delta theta) + s_S, (Delta R)/(Delta theta) + s_R) $
  ]

  We can use those equations to create an algorithm that runs every 10 miliseconds, shown below
  ```cpp
  void lib5839::threeWheelOdometry::step() {
    // get the distances each encoder moved the last tick
    QLength deltaV1 = sensors.vertical1->getDistanceTraveled() - prevV1;
    QLength deltaV2 = sensors.vertical2->getDistanceTraveled() - prevV2;
    QLength deltaH1 = sensors.horizontal1->getDistanceTraveled() - prevH1;
    
    prevV1 = sensors.vertical1->getDistanceTraveled();
    prevV2 = sensors.vertical2->getDistanceTraveled();
    prevH1 = sensors.horizontal1->getDistanceTraveled();

    // get change in heading
    deltaTheta = (deltaV1 - deltaV2) / (sensors.vertical1.getOffset() - sensors.vertical2.getOffset());
    avgHeading = currentPose.theta + deltaTheta / 2.0;

    // prevent divide by zero when finding local translation
    if (deltaTheta == 0) {
      localX = deltaH1;
      localY = deltaV1;
    } else {
      localX = 2 * sin(deltaTheta / 2) * (deltaH1 / deltaTheta + sensors.horizontal1.getOffset());
      localY = 2 * sin(deltaTheta / 2) * (deltaV1 / deltaTheta + sensors.vertical1.getOffset());
    }

    // convert local translation to global position
    currentPose.x += localY * sin(avgHeading);
    currentPose.y += localY * cos(avgHeading);
    currentPose.x += localX * -cos(avgHeading);
    currentPose.y += localX * sin(avgHeading);
    currentPose.theta += deltaTheta;
  }
  ```

  the odometry class also inherits from OkapiLib's base odometry class so it needs some other functions:
   - getState() - gets the current pose of the robot as calculated by the odometry
   - setState(Pose pose) - sets the current pose of the robot
   - getModel() - gets the chassis model the odometry is using
   - getScales() - get information about the position of the sensors, however since the positioning on our robot is incompatible with this function it will return an empty class

  This odometry class will be updated to also include the imu on the robot after we work on kalman filtering, which will help improve the accuracy of the odometry 

  #components.admonition(type: "tldr")[
    Odometry is a way for a robot to know its global position on the field by using 2-3 free spinning wheels, and using arcs to approximate the path the robot takes.
    
    The global position can be used to allow the robot to self correct even though major disturbances to the path.
  ]
]

#create-body-entry(
  title: "Mecanum Drivetrain Model",
  type: "program", 
  date: datetime(year: 2024, month: 3, day: 12),
  author: "Praful Adiga",
  witness: "Brandon Lewis"
)[
  A Mecanum drivetrain is a type of holonomic drivetrain, which means it can move in all directions without having to face in the direction it needs to move, basically, it can move sideways.
  
  This is useful in both driver control and autonomous, in driver control, this would help the driver maneuver around the field, avoiding conflicts with other teams, and better allowing the scoring of points around the field. And in autonomous this can allow the robot to not have to waste time turning before and after moving.
  
  Using a tank drivetrain, to move to a point, the robot needs to first face that point, by turning to $arctan((Delta y) / (Delta x))$ radians where $Delta y$ is the difference between the robot's y position and the y position of the goal point, and similarly for $Delta x$ we can then use the distance formula $sqrt((Delta x)^2 + (Delta y)^2)$ to move forward until we reach the goal point, then finally we have to turn to the desired angle. This takes 3 steps, but using a holonomic drivetrain we can just do that in one step

  To go from the robot's current position to a desired goal point, we first need to find the velocity and travel distance of each wheel separately, we found 2 different methods of calculating velocity, one just added up the turn, forward and strafe velocities with differing signs for each wheel, while the other algorithm uses the sine and cosine functions to compute the wheel velocity for the forward and strafe directions but then it adds the turn velocity separately. Both algorithms then need to normalize the values after adding the velocities together. However the first algorithm we mentioned is easier and gives a very similar result to the second algorithm, so we decided to use that algorithm.

  To find the wheel velocities $V_(F L)$, $V_(F R)$, $V_(B L)$, $V_(B R)$ we add the turn ($V_T$), forward ($V_F$) and strafe ($V_S$) velocities in the following ways

  #components.admonition(type: "equation")[
    $ V_(F L) = V_F + V_S + V_T $
    $ V_(F R) = V_F - V_S - V_T $
    $ V_(B L) = V_F + V_S - V_T $
    $ V_(B R) = V_F - V_S + V_T $
    we then have to normalize the values:
    if $max(V_(F L), V_(F R), V_(B L), V_(B R)) > V_"max"$ we need to multiply all wheel velocities by $V_"max" / V_"biggest"$ where $V_"biggest" = max(V_(F L), V_(F R), V_(B L), V_(B R))$    
  ]

  We first implemented this in python VexCode so we can test if the equations work, the results can be seen at #link("https://youtu.be/eSuvUhxxs34")

  After the successful results of the VexCode prototype, we then started working on the implementation in the library, the OkapiLib code style guide mandates that we build off of the ChassisModel base class, we did this and used many of the same functions as the X-drive class as the drivetrains are almost the same, just some small differences in the kinematic equations.

  The next step was to work on finding the travel distance for each wheel, this could be done by normalizing the vector for linear movement and and then multiplying by the distance to travel, finally the turn angle needs to be added on top of that using the same equations as a tank drivetrain, and finally we need to cap the values and scale them so give the desired velocities.
]

#create-body-entry(
  title: "Pure Pursuit",
  type: "program", 
  date: datetime(year: 2024, month: 3, day: 14),
  author: "Praful Adiga",
  witness: "Brandon Lewis"
)[
  Pure Pursuit is, in our opinion, the most useful algorithm that is used in the vex autonomous period. Pure Pursuit is, in essence, a algorithm to make the robot smoothly follow a predetermined path. 

  To learn the algorithm, i used Purdue Sigbots's #link("https://wiki.purduesigbots.com/software/control-algorithms/basic-pure-pursuit")[Resource] as a base and added on the features I wanted. Their website used a donkey chasing a carrot, which always stays in front of the donkey, as a helpful metaphor on how the algorithm actually worked

  #figure(
    rect(fill: black.lighten(10%))[
      #image("img\purePursuitMetaphor.gif", width: 80%)
    ],
    caption: [An image showing the metaphor used by the Purdue Sigbots Website on the Pure Pursuit Algorithm]
  )

  So speaking more technically, the algorithm is given a set of points on a path, these points are linearly interpolated between so the point density has to be high for the path to be accurate, the algorithm is also given the robot's position and a lookahead distance, the distance the robot should look ahead to find the point it's heading towards.
  
  We first need to find the point the robot is heading towards, we'll call this the goal point. The goal point needs to meet certain criteria,  
   - it needs to be on the path
   - it cannot be further away from the robot than the lookahead distance
   - it needs to be ahead of the nearest point to the robot on the path
   - it needs to be the furthest point on the path that satisfies the conditions above
  The criteria above do simplify the algorithm, however it creates some limitations:
   - the path cannot cross over itself, as the algorithm would skip part of the path
   - the lookahead distance needs to be tuned properly, high lookahead distance leads to path smoothness, but low leads to accuracy

  To find the goal point we draw a line between each point on the path, we then draw a circle, centered on the robot with a radius equal to the lookahead distance, and list any intersections, we then find the furthest point on the path and check if it is ahead of the robot, if the robot is ahead of the furthest point, we know the path is ending so we set the lookahead point to the final point in the path, otherwise it is the furthest point on the path. We can use the following code to find the goal point.

  .

  ```cpp
  struct Point {
      float x;
      float y;
  };

  path = [/* The path can be read from a file and formatted as an array of Points */]
  int get_closest_point(Point points[], Point to) {
      float smallestDist = 999999999999999999999999999999;
      int smallestIndex = -1;
      
      for (int i = 0; i < points.length; i++) {
          if (dst_btw_pts(points[i], to) < smallest) {
              smallestIndex = i;
              smallestDist = dst_btw_pts(points[i], to)
          }
      }

      return smallestIndex;
  }

  int get_discriminant(Point pt1, Point pt2, Point robotPos, float lookaheadDistance) {
      float x1 = pt1.x - robotPos.x;
      float y1 = pt1.y - robotPos.y;
      float x2 = pt2.x - robotPos.x;
      float y2 = pt2.y - robotPos.y;
      float dx = x2 - x1;
      float dy = y2 - y1;
      dr = std::sqrt(std::pow(dx, 2) + std::pow(dy, 2));
      D = x1 * y2 - x2 * y1;
      discriminant = std::pow(lookaheadDistance, 2) * std::pow(dr, 2)  - std::pow(D, 2);
      return discriminant;
  }

  Point find_goal_point(Point[] path, Point robotPos, float lookaheadDistance, int lastFoundPoint) {
      goalPt = Point(0, 0);
      std::vector<int> points = new std::vector<int>();

      for (int i = 0; i < path.length; i++) {
          discriminant = get_discriminant(path[i], path[i+1], robotPos, lookaheadDistance);
          if (discriminant >= 0) // we have an intersection
              points.add(i);
      }

      if (points.count() <= 0) // no intersected point, we have wandered from the path
          goalPt = path[lastFoundPoint];
      else if (get_closest_point(path, robotPos) > std::max(points)) // robot is farther than all intersected points, use last point in path
          goalPt = path[path.length];
      else
          goalPt = path[std::max(points)];

      return goalPt
  }
  ```
  
  we can then use PID loops to go towards the goal point and update it as we do so, finishing the pure pursit algorithm
]

#create-body-entry(
  title: "GUI",
  type: "program", 
  date: datetime(year: 2024, month: 3, day: 14),
  author: "Praful Adiga",
  witness: "Brandon Lewis"
)[
  == 3/14 progress

  Currently we have 3 screens for the GUI:
   - Autonomous Selector
   - PID Tuner
   - Odometry Debug Screen

  And using Squareline Studio, i have designed a screen for all of them, however this is likely to change as the designs aren't as aesthetically pleasing as i would like them to be. 

  _*Insert Images Here*_

  == 3/18 progress
  I have finished one of the three screens and got a working and interactive display on the brain, I started with the Auton Selector as I believed that that was the most important, as it will be used in every match, while the other 2 are just convinient for tuning

  Some errors i encountered were:
   - Memory Exceptions - this occurred when i tried to edit the properties of an lvgl object that was still uninitialized
   - Memory Overflow - this occurred when i attempted to load too many objects on the screen at a single time, which occurred because of a bug that prevented the objects from getting deleted when the competition mode was switched
   - Logic Errors - This was the worst type of error to debug, as i didn't know lvgl that well and so i had to create a blank screen to isolate the problem and try and fix it, often the error was when things aren't showing up, they are probably being hidden under another object
   - Problems with Static/Class functions - this was when i was working with callbacks, i had to create a static callback functions which meant that variables that belonged to the class couldn't be accessed, which caused me to consider scrapping the GUI
  
  #figure(
    rect(fill: black.lighten(10%))[
      #image("img\AutonSelector1.png", width: 80%)
    ],
    caption: [The Autonomous Selector Screen]
  )

  == 3/26 progress
    This time i worked on the Odom Debug Screen, which i felt was the easier of the 2, I managed to finish this class completely with the visuals and functionality cleanly incorporated into the class

    I did run into some of the same problems as the Autonomous Selector, however they were much rarer and easier to resolve, so i at least learned something

    The class included a function to display the debug screen and map along with a function to update the odometry values

    #figure(
    rect(fill: black.lighten(10%))[
      #image("img\OdomDebug2.png", width: 80%)
    ],
    caption: [The Odometry Debug Screen]
  )

  == 4/2 progress
  The final screen so far was the PID tuner, this needed to have a complex class and i was unsure how i could accomplish this using object oriented programming when lvgl is effectively fighting me on this. 

  Some of the problems i faced were how to switch between different PID loops, as i couldn't just store them in a list as the function couldn't access the list which is stored in the class. Another problem was how to update the values, not just in the program, but in the actual PID class, again the main problem was accessing the class to get the different PID loops. Another problem was retrieving the PID error information, which again was a problem related to accessing the class.

  I couldn't find any solution to this that both worked and was memory safe, I couldn't just put a pointer to the class in an arbitrary location and access it within the function, as that can cause more errors than it would solve. So i put off the functionality and just created the visuals with a temporary list of PID loops.

  #figure(
    rect(fill: black.lighten(10%))[
      #image("img\PIDTuner1.png", width: 80%)
    ],
    caption: [The PID Tuner Screen]
  ) 
]

#create-body-entry(
  title: "Behind Schedule",
  type: "management", 
  date: datetime(year: 2024, month: 5, day: 3),
  author: "Praful Adiga",
  witness: "Brandon Lewis"
)[
    Development on the robot has been mostly paused for the past month because the programmers were predisposed with family matters and schoolwork, It is likely to be paused for another 2 weeks as AP testing is upcoming. This is a huge setback to the library as most of the features are untested or nonexistent.

    The proposed solution is to scrap unnecessary features and use a preexisting library like LemLib or EZ Template, to make up for the lack of features.

    We have decided to keep the following features:
    - Autonomous Selector
    - PID Tuner
    - Odometry Debug Screen
    - Any other GUI we deem necessary
    - Interface Classes (this is to make EZ and Lemlib work well together)
    - Path Injector
    - SD card Logger

    A combination of those features combined with EZ Template, Lemlib and OkapiLib, will lead to a efficient autonomous.

    However changing to this new combination requires a different pros kernel (3.8.3) which is incompatible with the existing GUI and other code, So converting and improving the existing GUI classes are the first priority before getting the libraries to cooperate, as that also needs a functional robot
]


#create-appendix-entry(title: "Appendix A: Odometry Derivation")[
  #rect(fill: black.lighten(10%))[
    #image("img\OdomDiagram.png", width: 80%)
  ]
  We first start with the arc length formula and solve for $r_A$:
  #grid(
    columns: (1fr, 1fr),
    $ Delta L = r_L Delta theta $,
    $ Delta R = r_R Delta theta $,
    $ Delta L = (r_A + s_L) Delta theta $,
    $ Delta R = (r_A + s_R) Delta theta $,
    $ (Delta L) / (Delta theta) = r_A + s_L $,
    $ (Delta R) / (Delta theta) = r_A + s_R $,
    $ r_A = (Delta L)/(Delta theta) - s_L $,
    $ r_A = (Delta R)/(Delta theta) - s_R $,
  )
  The two equations can then be combined to eliminate the radius (the only unknown) and solved for $Delta theta$:
  $ (Delta L)/(Delta theta) - s_L = (Delta R)/(Delta theta) - s_R $
  $ Delta L - s_L Delta theta = Delta R - s_R Delta theta $
  $ Delta L - Delta R = Delta theta (s_L - s_R) $
  $ Delta theta = (Delta L - Delta R)/(s_L - s_R) $
  To find the local translation, we first need to set the local coordinate system, the easiest one being one where the y axis coincides with the endpoints of the arc. This will allow us to calculate the y translation using the equation for chord length:
  $ 2 sin ((Delta theta) / 2) * ((Delta R)/(Delta theta) + s_R) $
  And now we can use the back wheel to find out how much the robot strays from the arc, by approximating another arc, and this arc's chord is perpendicular to the chord of the main arc so we can use the same formula for chord length and just add it to the y translation to make a translation vector:
  $ 2 sin ((Delta theta) / 2) * vec(((Delta S)/(Delta theta) + s_S), ((Delta R)/(Delta theta) + s_R)) $ 
  And to rotate the local translation vector back to the global coordinate system we rotate it back by $theta_0 + (Delta theta) / 2$ which is the angle of the main chord, using the following equation:
  $ vec(Y_l sin(theta_0 + (Delta theta) / 2) - X_l cos(theta_0 + (Delta theta) / 2), Y_l cos(theta_0 + (Delta theta) / 2) + X_l sin(theta_0 + (Delta theta) / 2)) $

]


#glossary.add-term("delimitator")[A character or set of characters that separate parts of a string]
#glossary.add-term("pose")[A structure containing the x, y, and heading of the robot]
#glossary.add-term("GUI")[Graphical User Interface - A way to display information on the robot brain in a clean and presentable manner]
#glossary.add-term("PID")[Proportional, Integral, Derivative - A type of control loop that takes in error and returns new motor value]
#glossary.add-term("PTO")[Power Take Off - A mechanism where a single motor can switch between powering 2 different mechanism using pneumatics]

#create-appendix-entry(title: "Glossary")[
  #components.glossary()
]

#create-appendix-entry(title: "Credits")[
   - Purdue Sigbots
   - The creators and contributors to PROS
   - The creators and contributors to OkapiLib
   - The creators and contributors to LemLib
   - Theo from Team 7842F/B
   - Felix from 53E 
   - 
]