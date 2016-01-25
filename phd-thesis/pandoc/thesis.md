%A Family of Role Modeling Languages
%Nathan Fillion
%30.9.2000
---
#cd: true           # optional to modify the kind of cooperate design
#replacefont: cmbright    # optional to replace tud fonts with another font
sfmath: cmbright   # optional to add sfmath option and modify math fonts
chapterpage: false # optional to have chapter titles on a single page
blocking: false    # optional to create a restriction note
lang: "english"    # required to set the main language of the document
nocite: true      # optional to import all citations
# required for a dissertation
title: 'A Family of Role Modeling Languages'  
author: "Nathan Fillion"
faculty: "Faculty of Computer Science"
department: ""
institute: "Institute of Software and Multimedia Technology"
chair: "Software Technology Group"
dateofbirth: "01.01.1970"
placeofbirth: "Moscow"
# optional but recommended for a dissertation
graduation:
  - short: "Dr.-Ing."
    description: "Doktor-Ingenieur"
referees: ["Robert Picardo"]
professors: ["Patrick Stewart", "Leonard Nimoy "]
abstract:
  - default: "\\blindtext" # required
    german: "\\blindtext" 
biblio-title: "References"
abbr-title: "List of Abbreviations"
dedication: "For my loving children" # optional
# optional to allow for the creation of acronyms
acronyms:  
  - short: RML
    long:  Role Modeling Language
    short-plural: s
    long-plural: s
preamble: | # optional additions to the latex preamble
	\usepackage{pbox}
	\usepackage{xspace}
	\usepackage{semantic}
	\newcommand{\I}{\ensuremath{\mathcal{I}}\xspace}
	\newcommand{\R}{\ensuremath{\mathcal{R}}\xspace}
	\newcommand{\true}{\ensuremath{\mathsf{T}}\xspace}
	\newcommand{\false}{\ensuremath{\mathsf{F}}\xspace}
	\newcommand{\nat}{\ensuremath{\mathbb{N}}\xspace}
	\DeclareMathOperator{\rimpl}{-\!{\triangleright}}
	\DeclareMathOperator{\requi}{\triangleleft-\!{\triangleright}}
	\DeclareMathOperator{\rproh}{\shortparallel}
	\DeclareMathOperator{\rdont}{\sim}
	\newtheorem{definition}{Definition}
	\newtheorem{example}{Example}
	\usepackage{blindtext}
...

<!--- Display level 1 headings as Chapters --->


<!--- Define a set of handy macros for typical latex commands --->


<!--- Part 1 --->
\part{State of the Art}  

# Introduction

\ac{RML} is awesome [@kuehn2014].
\acfp{RML} are even better [@kuehn2014].

## Motivation

\blindtext

## Background

\blindtext

## Problem Definition

\blindtext

## Outline


# Prerequisites

## First Order Logic

\blindtext

## Feature Modeling

\blindtext

## Language Product Lines

# Background

\blindtext

## The Nature of Roles

\blindtext

### Behavioral Nature

\blindtext

### Relational Nature

\blindtext

### Context-Dependent Nature

<!--- Part 2 --->
\part{Solution}  

# Formal Role-based Modeling Language

## Formalization

### Type Level

After introducing the ontological foundations and the graphical notation,
we can introduce our formal model, starting on the type level.
For brevity, we omitted the notion of *attributes* from these definitions.
Nevertheless, the necessary additions are presented in the Appendix.

\begin{definition}[Compartment Role Object Model]
Let $NT$, $RT$, $CT$, and $RST$ be mutual disjoint sets of 
Natural Types, Role Types, Compartment Types, and Relationship Types, respectively.
Then a \emph{Compartment Role Object Model (CROM)} is a tuple $\mathcal{M}=(NT, RT, CT,RST,\text{fills}, \text{parts}, \text{rel})$ where
$\text{fills} \subseteq (NT \cup CT) \times RT$ is a relation,
$\text{parts} : CT \rightarrow 2^{RT} $ and
$\text{rel} : RST \rightarrow (RT \times RT$) are total functions.
A CROM is denoted \emph{well-formed} if the following axioms hold:
\begin{align}
\forall rt \in RT   &\ \exists t \in (NT \cup CT) : (t,rt) \in \text{fills}\\
\forall ct \in CT   &: \text{parts}(ct) \neq \emptyset\\
\forall rt \in RT   &\ \exists ! ct \in CT : rt \in \text{parts}(ct)\\
\forall rst \in RST &: \text{rel}(rst) = (rt_1,rt_2) \wedge rt_1 \neq rt_2\\
\forall rst \in RST &\ \exists ct \in CT : \text{rel}(rst) = (rt_1,rt_2)\ \wedge\nonumber\\
                    &\ rt_1,rt_2 \in \text{parts}(ct)
\end{align} 
\end{definition}

\noindent
In detail, *fills* denotes that rigid types can play roles of a certain role type,
*parts* maps compartment types to their contained role types, and
*rel* captures the two role types at the respective ends of each relationship type.
The well-formedness rules ensure that the *fills*-relation is surjective (1); 
each compartment type has a nonempty, disjoint set of role types as its parts (2, 3); and
*rel* maps each relationship type to exactly two distinct role types of the same compartment type
(4, 5).

\begin{example}[Compartment Role Object Model]
Let $\mathcal{B} = (NT, RT, CT, RST,\text{fills}, \text{parts}, \text{rel})$ be the model of the bank,
where the idividual components are defined as follows:
\begin{align*}
NT \coloneqq \{ &\text{Person}, \text{Company}, \text{Account} \}\\
RT \coloneqq \{ &\text{Customer}, \text{Consultant},\text{CA},\text{SA},\text{Source},\text{Target},\\
                &\text{MoneyTransfer} \}\\
CT = \{ &\text{Bank}, \text{Transaction} \}\\
RST = \{ &\text{own\_ca}, \text{own\_sa}, \text{advises}, \text{trans} \}\\
\mathit{fills} \coloneqq \{ &(\text{Person}, \text{Consultant}), (\text{Person}, \text{Customer}),%\\
\end{align*}
%$NT \coloneqq \{ \text{Person}, \text{Company}, \text{Account} \}$ is the set of natural types,\linebreak
%$RT \coloneqq \{ \text{Customer}, \text{Consultant},\text{CA},\text{SA},\text{Source},\text{Target},$ $\text{MoneyTransfer} \}$ the set of role types,
%$CT = \{\text{Bank},$ $\text{Transaction} \}$ the set of compartment types, and
%$RST = \{\text{own\_ca},$ $\text{own\_sa},$ $\text{advises},$ $\text{trans} \}$ the set of relationship types.
%The other elements are specified as follows:
\begin{align*}
            & (\text{Company}, \text{Customer}), (\text{Account}, \text{Source}),\\
            & (\text{Account}, \text{Target}), (\text{Account}, \text{CA}),\\
            & (\text{Account}, \text{SA}), (\text{Transaction}, \text{MoneyTransfer}) \}\\
 \mathit{parts} \coloneqq \{ & \text{Bank} \rightarrow \{\text{Consultant},\text{Customer},\text{CA},\text{SA},\\
                                                        &\ \text{MoneyTransfer} \},\\
                                          & \text{Transaction} \rightarrow \{ \text{Source},\text{Target}\} \}\\
 \mathit{rel} \coloneqq \{ & \text{own\_ca} \rightarrow (\text{Customer},\text{CA}),\\
                           & \text{own\_sa} \rightarrow (\text{Customer},\text{SA}),\\
                           & \text{advises} \rightarrow (\text{Consultant},\text{Customer}),\\
                           & \text{trans} \rightarrow (\text{Source},\text{Target}) \}
\end{align*}
\end{example}

\noindent
The bank model $\mathcal{B}$ is simply created in four steps.
First, all the natural types, compartment types, role types, and relationship types are collected into the corresponding set.\footnotemark[1]
 Second, the set of role types contained in each compartment type is assigned to the *parts*-function.
Third, it is specified which natural type can *fill* which role type, and finally
the *rel*-function is defined for the role types at the ends of each relationship type.
Thus, CROMs can be retrieved from their graphical representation.
The presented bank model $\mathcal{B}$ is well-formed,
because each defined role type is filled by at least one natural type or compartment type (1),
each compartment type consists of a non-empty (2) and disjoint (3) set of role types,
and each relationship type is established between two distinct role types (4) of the same compartment type (5).
<!--Despite the fact, that the model is well-formed, it has no meaning without taking instances of this model into account. Nevertheless, a model has no meaning without taking its instances into account.-->


### Instance Level

### Constraint Level

# First Family of Role-based Modeling Editors

## Architecture
## Configuration
## Family of Model Transformations


# Conclusion

## Summery

## Related Work
## Contributions
## Future Research
### Adding Time to the Formal Model
### UML Scenario Analysis
	
