#import "/lib.typ": *
#import themes.radial: radial-theme, components, colors
#import colors: *

#show: notebook.with(theme: radial-theme, team-name: "5839B", season: "Water Game", year: "2024-2025")


#create-frontmatter-entry(
  title: "Table of Contents",
)[
  #components.toc()
]

#create-body-entry(
  title: "First Steps",
  type: "decide",
  date: datetime(year: 2024, month: 3, day: 5),
  author: "Praful Adiga",
  witness: "Brando"
)[
  = Post Season Notes
  With the end of the Over Under season, sadly we didn't make it to worlds, we evalutated our progress and decided that we need a better programming library. My job as the coder is to record and create a programming library that serves all our needs for the improved robot.

  In the Over Under season we didn't get all of the systems we wanted running working in time for the competition, for the autonomous we used PROS with both the OkapiLib library and the LemLib library, however each of those had its own shortcommings, so we decided to create our own library.

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
    ("LemLib",   2, 3, 3, 2, 1, 1),
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
    We decided to build the library of of OkapiLib in the end, as it has more flexibility, and a solid codebase.
  ]

  = Nessasary Components

  We have a limited time to develop the library, as schoolwork and jobs eat into the development time, so we made a ongoing list, shown below, that shows all the features we need in the library along with a short explaination of the feature, a longer explaination will be given in a dedicated section of the notebook

   - *Mecanum Drivetrain Model* - Although OkapiLib has an X-drive model, it doesn't have a Mechanum drive model, which has slightly different kinematics
   - *Boosted Mecanum Wheel Model* - Since out robot not only has a 4 motor mechanum drivetrain, the drivetrain also includes 2 seperately powered omni-wheels to help boost forward torque
   - *Custom Odometry* - Although OkapiLib already has odometry, our design places all of the odometry pods in a straight line with the 2 forward facing wheels not being centered, OkapiLib doesn't support this so we need to create a custom odometry class for this, however this should be fairly straightforward
   - *PID and other Control Loops* - this will allow us to have fast and accurate movements
   - *Pure Pursuit* - Pure Pursuit is an algorithm that allows the robot to follow paths smoothly, even with disturbances, which is nessasary for a fast and accurate autonomous period
   - *Asset* - this is a helpful utility from LemLib that would be very helpful in creating Pure Pursuit paths, as it allows the coder to not have to remove and reinsert the SD card every time a path is updated
   - *GUI* - this is nessasary as it allows us to live tune variables, for exmaple, we can create a PID tuner wo we don't have to recompile after changing a single variable, this will speed up tuning by a significant amount as half the time it takes to to tune PID is spent waiting for code to compile

]