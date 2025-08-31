#import "tech-lead-cv.typ": vantage, term, skill, styled-link
#let configuration = yaml("configuration.yaml")

#tech-lead-cv(
  name: configuration.contacts.name,
  position: configuration.position,
  links: (
    (name: "email", link: "mailto:"+ configuration.contacts.email),
    (name: "github", link: configuration.contacts.github.url, display: configuration.contacts.github.displayText),
    (name: "linkedin", link: configuration.contacts.linkedin.url, display: configuration.contacts.linkedin.displayText),
    (name: "location", link: "", display: configuration.contacts.address)
  ),
  tagline: (configuration.tagline),
  [

    == Accomplishments
    #for accomplishments in configuration.accomplishments[
      - #configuration.accomplishments  

     ]
    
    == Experience

    #for job in configuration.jobs [
      === #job.position \
      _#link(job.company.link)[#job.company.name]_ - #styled-link(job.product.link)[#job.product.name] \
      #term[#job.from --- #job.to][#job.location]

      #for point in job.description [
        - #point
      ]
    ]
    
  ],
  [
  
    == Domain Expertise

    #for expertise in configuration.technical_expertise [
      #skill 
    ]

    == Software Skills

    #for skill in configuration.software_skills [
      • #skill
    ]

    == Processes
    #for method in configuration.methodology [
      • #method
    ]
    
    == Tools
    #for tool in configuration.tools [
      • #tool
    ]

    == Education
  
      #for edu in configuration.education [
        === #if edu.place.link != "" [
          #link(edu.place.link)[#edu.place.name]\
        ] else [
          #edu.place.name\
        ]
  
        #edu.from - #edu.to #h(1fr) #edu.location
  
        #edu.degree in #edu.major
  
      ]

      == Affiliation
  
      #for edu in configuration.education [
        === #if edu.place.link != "" [
          #link(edu.place.link)[#edu.place.name]\
        ] else [
          #edu.place.name\
        ]
  
        #edu.from - #edu.to #h(1fr) #edu.location
  
        #edu.degree in #edu.major
  
      ]

  ]
)
