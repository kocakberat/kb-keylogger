#set page(
  paper: "a4",
  margin: (x: 2cm, y: 2cm),
  footer: context [
    #set align(center)
    #counter(page).display()
  ]
)

#set text(font: "New Computer Modern",size: 12pt)
#set par(justify: true)

#let cpp(code) = {
  let lines = code.text.split("\n")
  block(
    width: 100%,
    radius: 4pt,
    stroke: luma(200),
    clip: true,
    stack(
      block(
        fill: luma(200),
        width: 100%,
        inset: 8pt,
        text(weight: "bold", size: 1em, "C++")
      ),
      block(
        fill: luma(235),
        width: 100%,
        inset: 10pt,
        {
          set par(leading: 0.5em)
          for (i, line) in lines.enumerate() {
            box(width: 2.5em, text(fill: luma(150), str(i + 1)))
            raw(line, lang: "C++")
            linebreak()
          }
        }
      )
    )
  )
}

#align(center)[
  #block(inset: (top: 11em, bottom: 2em))[
    #text(weight: "bold", size: 2.14em)[kb-keylogger] \
    #v(0.2em)
    #text(weight: "bold", size: 2.14em)[Malware & Forensics Project] \
    #line(length: 100%, stroke: 0.5pt + gray)
    #v(0.5em)
    #text(weight: "regular", size: 1.4em)[Berat Kocak] \
    #v(0.2em)
    #text(weight: "regular", size: 1.4em)[April 2026] \
  ]
]
#pagebreak()

#outline(
  title: "Contents",
  indent: auto,
)
#set heading(numbering: "1.")

#pagebreak()
= Project Overview 
This project demonstrates a two-phased attack and detection scenario. In the first phase, a hardware keylogger intercepts keyboard input on a target machine and periodically exfiltrates the captured data to a remote server every 10 minutes. In the second stage, forensic analysis is conducted on the target system to reconstruct the attack timeline and identify evidence of the data exfiltration.

== Motivation & Learning Objectives
The primary objective of this project is to explore and understand the technical lifecycle of credential exfiltration. By developing and analyzing the tool, I aim to address the following questions:
+ Technical Implementation
 - *Input Hooking:* Understanding the architectural differences in how various Operating Systems process keyboard interrupts.
 - *Stealth:* Developing methods to capture inputs without disrupting the user experience or triggering system alerts.

+ Data Management & Exfiltration
 - *Storage:* Determining efficient and secure structures for local log storage.
 - *Exfiltration:* Defining protocols for remote C2 transmission.
 - *Noise Reduction:* Implementing techniques to minimize the digital footprint of data transmission to evade detection.

+ Critical Evaluation
 - *Iterative Development:* Identifying weaknesses in the initial design and implementing structural improvements.
 - *Infection Vectors*: Moving away from a hardware to a software-only solution. 
 - *Gap Analysis:* Documenting persistent technical challenges and areas for further research.

== Scope
The technical scope of this project is confined to the development of the kb-keylogger and its subsequent forensic analysis within a controlled environment. Malware characteristics such as boot-level persistence, EDR or Antivirus evasion and the weaponization of the tool are explicitly excluded.

== Disclaimer
_ The goal of this project is exclusively to educate myself on this topic and learn new technologies and their security implications. The author assumes no responsibility for any misuse or damages arising from the application of the information contained within this report. _

#pagebreak()
= Phase A: Keylogger Development
== Hardware
I am using a WaveShare ESP32-S3 Mini Microcontroller, which will connect to the target machine via USB-C port. The keylogger is going to be uploaded to this device and monitor the keypoard inputs on the target machine. 
#figure(
  image("images/microcontroller.png" , width:70%),
  caption:[The WaveShare ESP32-S3 Mini and its built-in USB-C Port]
)

== Design & Architecture

#figure(
  image("images/DFDP1K.svg", width:100%),
  caption: [First draft of the Data Flow Diagram]
)

== Implementation Details

=== Keyboard Capture Linux

=== Keyboard Capture Windows

=== Keyboard Capture MacOS

=== Data Logging

=== Exfiltration

== Challenges & Solutions

#pagebreak()
= Phase B: Forensic Analysis
== Methodology and Tools 
== Evidence Collection
=== Traffic Capture
=== System artifacts
== Analysis 
=== Networt traffic
=== Behavior

#pagebreak()
= Results & Observations
== Reflection on Initial Goals

#pagebreak()
= Future Improvements 
== Keylogging
== Defensive Implications

#pagebreak()
= Appendix
== Source Codes
== Screenshots
== Timeline tables