USE [SWP_PROJECT]
GO
--role : 1 la thi sinh ; 2 la giao vien ; 3 la it
INSERT INTO [dbo].[Users]
VALUES
( 'Nguyen Van A', 'nguyenvana1@gmail.com', 'password123',  '123456789012345678901', DEFAULT, DEFAULT),
('Tran Thi B', 'tranthib2@gmail.com', 'password456',  '234567890123456789012', DEFAULT, DEFAULT),
( 'Le Van C', 'levanc3@gmail.com', 'password789',  '345678901234567890123', DEFAULT, DEFAULT),
( 'Pham Thi D', 'phamthid4@gmail.com', 'password123',  '456789012345678901234', DEFAULT, DEFAULT),
( 'Hoang Van E', 'hoangvane5@gmail.com', 'password456',  '567890123456789012345', DEFAULT, DEFAULT),
( 'Bui Thi F', 'buithif6@gmail.com', 'password789',  '678901234567890123456', DEFAULT, DEFAULT),
( 'Nguyen Van G', 'nguyenvang7@gmail.com', 'password123',  '789012345678901234567', DEFAULT, DEFAULT),
( 'Le Van I', 'levani9@gmail.com', 'password789',  '901234567890123456789', DEFAULT, DEFAULT),
( 'Pham Thi J', 'phamthij10@gmail.com', 'password123',  '012345678901234567890', DEFAULT, DEFAULT),
( 'Hoang Van K', 'hoangvank11@gmail.com', 'password456',  '123456789012345678900', DEFAULT, DEFAULT),
( 'Tran Thi N', 'tranthin14@gmail.com', 'password456', '456789012345678901023', DEFAULT, DEFAULT),
( 'Le Van O', 'levano15@gmail.com', 'password789',  '567890123456789012034', DEFAULT, DEFAULT),
( 'Pham Thi P', 'phamthip16@gmail.com', 'password123',  '678901234567890123045', DEFAULT, DEFAULT),
( 'Hoang Van Q', 'hoangvanq25@gmail.com', 'password456',  '789012345678901234056', DEFAULT, DEFAULT),
('Nguyen Van S', 'nguyenvans22@gmail.com', 'password123','901234567890123456078',DEFAULT, DEFAULT),
( 'Tran Thi T', 'tranthit24@gmail.com', 'password456', '012345678901234567089', DEFAULT, DEFAULT),
( 'Bac', 'bacbxhe186736@fpt.edu.vn', 'password123',  '012345678905454465181', DEFAULT, DEFAULT),
( 'Trung Kien', 'kientthe186727@fpt.edu.vn', 'password456',  '012345678901454545864', DEFAULT, DEFAULT),
( 'Duc Tuan', 'tuanndhe186995@fpt.edu.vn', 'password789', '012345678905656661581', DEFAULT, DEFAULT),
( 'Chi Bang', 'bangtche180772@fpt.edu.vn', 'password123',  '012345678901561568379', DEFAULT, DEFAULT),
( 'Lam Tung', 'tungnlhe186756@fpt.edu.vn', 'password456',  '012345678901252661515', DEFAULT, DEFAULT);

INSERT INTO [dbo].[Role]
VALUES
(1),
(1),
(1),
(1),
(1),
(1),
(2),
(1),
(1),
(1),
(2),
(1),
(2),
(1),
(1),
(2),
(3),
(3),
(3),
(3),
(3);

INSERT INTO [dbo].[Topic_Exam] 
VALUES
(7),
(16),
(20),
(14),
(16),
(14),
(7),
(20),
(16),
(20);

INSERT INTO [dbo].[Reading] 
VAlUES
(1,25,'AIR CONDITIONING','The history of an invention that makes life more pleasant|-line break-|Willis Carrier designed the first air-conditioning unit in 1902, just a year after graduating from Cornell University with a Masters in Engineering.|-line break-|At a Brooklyn printing plant, fluctuations in heat and moisture were causing the size of the printing paper to keep changing slightly, making it hard to align different colours. Carrier''s invention made it possible to control temperature and humidity levels and so align the colours. The invention also allowed industries such as film, processed food, textiles and pharmaceuticals to improve the quality of their products.|-line break-|In 1914, the first air-conditioning device was installed in a private house. However, its size, similar to that of an early computer, meant it took up too much space to come into widespread use, and later models, such as the Weathermaker, which Carrier brought out in the 1920s, cost too much for most people. Cooling for human comfort, rather than industrial need, really took off when three air conditioners were installed in the J.L. Hudson Department Store in Detroit, Michigan. People crowded into the shop to experience the new invention. The fashion spread from department stores to cinemas, whose income rose steeply as a result of the comfort they provided.|-line break-|To start with, money-conscious employers regarded air conditioning as a luxury. They considered that if they were paying people to work, they should not be paying for them to be comfortable as well. So in the 1940s and ''50s, the industry started putting out a different message about its product: according to their research, installing air conditioning increased productivity amongst employees. They found that typists increased their output by 24% when transferred from a regular office to a cooled one. Another study into office working conditions, which was carried out in the late ''50s, showed that the majority of companies cited air conditioning as the single most important contributor to efficiency in offices.|-line break-|However, air conditioning has its critics. Jed Brown, an environmentalist, complains that air conditioning is a factor in global warming. Unfortunately, he adds, because air conditioning leads to higher temperatures, people have to use it even more. However, he admits that it provides a healthier environment for many people in the heat of summer.'),
(2,25,'THE NEW WAY TO BE FIFTH-GRADER','Khan Academy is changing the rules of education.|-line break-|I peer over his shoulder at his laptop screen to see the math problem the fifth-grader is pondering. It''s a trigonometry problem. Carpenter, a serious-faced ten-year-old, pauses for a second, fidgets, then clicks on ''0 degrees.'' The computer tells him that he''s correct. ''It took a while for me to work it out,'' he admits sheepishly. The software then generates another problem, followed by another, until eventually he''s done ten in a row.|-line break-|Last November, his teacher, Kami Thordarson, began using Khan Academy in her class. It is an educational website on which students can watch some 2,400 videos. The videos are anything but sophisticated. At seven to 14 minutes long, they consist of a voiceover by the site''s founder, Salman Khan, chattily describing a mathematical concept or explaining how to solve a problem, while his hand-scribbled formulas and diagrams appear on-screen. As a student, you can review a video as many times as you want, scrolling back several times over puzzling parts and fast-forwarding through the boring bits you already know. Once you''ve mastered a video, you can move on to the next one.|-line break-|Initially, Thordarson thought Khan Academy would merely be a helpful supplement to her normal instruction. But it quickly became far more than that. She is now on her way to ''flipping'' the way her class works. This involves replacing some of her lectures with Khan''s videos, which students can watch at home. Then in class, they focus on working on the problem areas together. The idea is to invert the normal rhythms of school, so that lectures are viewed in the children''s own time and homework is done at school. It sounds weird, Thordarson admits, but this reversal makes sense when you think about it. It is when they are doing homework that students are really grappling with a subject and are most likely to want someone to talk to. And Khan Academy provides teachers with a dashboard application that lets them see the instant a student gets stuck.|-line break-|For years, teachers like Thordarson have complained about the frustrations of teaching to the ''middle'' of the class. They stand at the whiteboard trying to get 25 or more students to learn at the same pace. Advanced students get bored and tune out, lagging ones get lost and tune out, and pretty soon half the class is not paying attention. Since the rise of personal computers in the 1980s, educators have hoped that technology could save the day by offering lessons tailored to each child. Schools have spent millions of dollars on sophisticated classroom technology, but the effort has been in vain. The one-to-one instruction it requires is, after all, prohibitively expensive. What country can afford such a luxury?|-line break-|Khan never intended to overhaul the school curricula and he doesn''t have a consistent, comprehensive plan for doing so. Nevertheless, some of his fans believe that he has stumbled onto the solution to education''s middle-of-the-class mediocrity. Most notable among them is Bill Gates, whose foundation has invested $1.5 million in Khan''s site. Students have pointed out that Khan is particularly good at explaining all the hidden, small steps in math problems�steps that teachers often gloss over. He has an uncanny ability to inhabit the mind of someone who doesn''t already understand something.|-line break-|However, not all educators are enamoured with Khan and his site. Gary Stager, a long�time educational consultant and advocate of laptops in classrooms, thinks Khan Academy is not innovative at all. The videos and software modules, he contends, are just a high-tech version of the outdated teaching techniques�lecturing and drilling. Schools have become ''joyless test-prep factories,'' he says, and Khan Academy caters to this dismal trend.|-line break-|As Sylvia Martinez, president of an organization focusing on technology in the classroom, puts it, ''The things they''re doing are really just rote.'' Flipping the classroom isn''t an entirely new idea, Martinez says, and she doubts that it would work for the majority of pupils: ''I''m sorry, but if they can''t understand the lecture in a classroom, they''re not going to grasp it better when it''s done through a video at home.''|-line break-|Another limitation of Khan''s site is that the drilling software can only handle questions where the answers are unambiguously right or wrong, like math or chemistry; Khan has relatively few videos on messier, grey-area subjects like history. Khan and Gates admit there is no easy way to automate the teaching of writing�even though it is just as critical as math.|-line break-|Even if Khan is truly liberating students to advance at their own pace, it is not clear that schools will be able to cope. The very concept of grade levels implies groups of students moving along together at an even pace. So what happens when, using Khan Academy, you wind up with a ten-year- old who has already mastered high-school physics? Khan''s programmer, Ben Kamens, has heard from teachers who have seen Khan Academy presentations and loved the idea but wondered whether they could modify it ''to stop students from becoming this advanced.''|-line break-|Khan''s success has injected him into the heated wars over school reform. Reformers today, by and large, believe student success should be carefully tested, with teachers and principals receiving better pay if their students advance more quickly. In essence, Khan doesn''t want to change the way institutions teach; he wants to change how people learn, whether they''re in a private school or a public school � or for that matter, whether they''re a student or an adult trying to self-educate in Ohio, Brazil, Russia, or India. One member of Khan''s staff is spearheading a drive to translate the videos into ten major languages. It''s classic start-up logic: do something novel, do it with speed, and the people who love it will find you.'),
(3,25,'Australian Agricultural Innovations:1850 � 1900','During this period, there was a wide spread expansion of agriculture in Australia. The selection system was begun, whereby small sections of land were parceled out by lot. Particularly in New South Wales, this led to conflicts between small holders and the emerging squatter class, whose abuse of the system often allowed them to take vast tracts of fertile land.|-line break-|There were also many positive advances in farming technology as the farmers adapted agricultural methods to the harsh Australian conditions. One of the most important was �dry farming�. This was the discovery that repeated ploughing of fallow, unproductive land could preserve nitrates and moisture, allowing the land to eventually be cultivated. This, along with the extension of the railways allowed the development of what are now great inland wheat lands.|-line break-|The inland areas of Australia are less fertile than most other wheat producing countries and yields per acre are lower. This slowed their development, but also led to the development of several labour saving devices. In 1843 John Ridley, a South Australian farmer, invented �the stripper�, a basic harvesting machine. By the 1860s its use was widespread. H. V. McKay, then only nineteen, modified the machine so that it was a complete harvester: cutting, collecting and sorting. McKay developed this early innovation into a large harvester manufacturing industry centred near Melbourne and exporting worldwide. Robert Bowyer Smith invented the �stump jump plough�, which let a farmer plough land which still had tree stumps on it. It did this by replacing the traditional plough shear with a set of wheels that could go over stumps, if necessary.|-line break-|The developments in farm machinery were supported by scientific research. During the late 19th century, South Australian wheat yields were going down. An agricultural scientist at the colony�s agricultural college, John Custance, found that this was due to a lack of phosphates and advised the use of soluble superphosphate fertilizer. The implementation of this scheme revitalised the industry.|-line break-|From early days it had been obvious that English and European sheep breeds had to be adapted to Australian conditions, but only near the end of the century was the same applied to crops. Prior to this, English and South African strains had been use, with varying degrees of success. William Farrer, from Cambridge University, was the first to develop new wheat varieties that were better able to withstand dry Australian conditions. By 1914, Australia was no longer thought of as a land suitable only for sheep, but as a wheat growing nation.'),
(4,25,'WHY DON''T BABIES TALK LIKE ADULTS?','A recent e-trade advertisement shows a baby speaking directly to the camera: ''Look at this,'' he says, I''m a free man. I go anywhere I want now.� He describes his stock-buying activities, and then his phone rings. This advertisement proves what comedians have known for years: few things are as funny as a baby who talks like an adult. But it also raises an important question: Why don�t young children express themselves clearly like adults?|-line break-|Many people assume children learn to talk by copying what they hear. In other words, they listen to the words adults use and the situations in which they use them and imitate accordingly. Behaviourism, the scientific approach that dominated American cognitive science for the first half of the 20th century, made exactly this argument.|-line break-|However, this �copycat� theory can�t explain why toddlers aren�t as conversational as adults. After all, you never hear literate adults express themselves in one-word sentences like �bottle� or �doggie�. In fact, it''s easy for scientists to show that a copycat theory of language acquisition can�t explain children�s first words. What is hard for them to do is to explain these first words, and how they fit into the language acquisition pattern.|-line break-|Over the past half-century, scientists have settled on two reasonable possibilities. The first of these is called the �mental-developmental hypothesis�. It states that one-year-olds speak in baby talk because their immature brains can�t handle adult speech. Children don''t learn to walk until their bodies are ready. Likewise, they don''t speak multi-word sentences or use word endings and function words (�Mummy opened the boxes'') before their brains are ready.|-line break-|The second is called the �stages-of-language hypothesis�, which states that the stages of progress in child speech are necessary stages in language development.|-line break-|A basketball player can''t perfect his or her jump shot before learning to (1) jump and (2) shoot. Similarly, children learn to multiply after they have learned to add. This is the order in which children are taught - not the reverse. There''s evidence, for instance, that children don�t usually begin speaking in two-word sentences until they�ve learned a certain number of single words. In other words, until they�ve crossed that linguistic threshold, the word-combination process doesn�t get going.|-line break-|The difference between these theories is this: under the mental-development hypothesis, language learning should depend on the child�s age and level of mental development when he or she starts learning a language. Linder the stages-of-language hypothesis, however, it shouldn�t depend on such patterns, but only on the completion of previous stages.|-line break-|In 2007, researchers at Harvard University, who were studying the two theories, found a clever way to test them. More than 20,000 internationally adopted children enter the US each year. Many of them no longer hear their birth language after they arrive, and they must learn English more or less the same way infants do - that is, by listening and by trial and error. International adoptees don�t take classes or use a dictionary when they are learning their new tongue and most of them don�t have a well-developed first language. All of these factors make them an ideal population in which to test these competing hypotheses about how language is learned.|-line break-|Neuroscientists Jesse Snedeker, Joy Geren and Carissa Shafto studied the language development of 27 children adopted from China between the ages of two and five years. These children began learning English at an older age than US natives and had more mature brains with which to tackle the task. Even so, just as with American-born infants, their first English sentences consisted of single words and were largely bereft of function words, word endings and verbs. The adoptees then went through the same stages as typical American-born children, albeit at a faster clip. The adoptees and native children started combining words in sentences when their vocabulary reached the same sizes, further suggesting that what matters is not how old you are or how mature your brain is, but the number of words you know.|-line break-|This finding - that having more mature brains did not help the adoptees avoid the toddler-talk stage - suggests that babies speak in babytalk not because they have baby brains, but because they have only just started learning and need time to gain enough vocabulary to be able to expand their conversations. Before long, the one-word stage will give way to the two-word stage and so on. Learning how to chat like an adult is a gradual process.|-line break-|But this potential answer also raises an even older and more difficult question. Adult immigrants who learn a second language rarely achieve the same proficiency in a foreign language as the average child raised as a native speaker. Researchers have long suspected there is a �critical period� for language development, after which it cannot proceed with full success to fluency. Yet we still do not understand this critical period or know why it ends.');

--cac dap an khac nhau tach nhau bang |-another answer-|
INSERT INTO [dbo].[Questions_Reading]
VALUES
('When Willis Carrier invented air conditioning, his aim was to','make workers feel cooler.|-another answer-|produce more attractive paper.|-another answer-|set up a new business.|-another answer-|solve problems in a factory.','solve problems in a factory.','Willis Carrier invented the first air-conditioning unit to control temperature and humidity levels at a Brooklyn printing plant. This was necessary to prevent the fluctuations in heat and moisture that were causing the size of the printing paper to change, making it hard to align different colours.',1),
('Home air conditioners were not popular at first because they were','too big and expensive.|-another answer-|not considered necessary.|-another answer-|too inefficient.|-another answer-|complicated to use.','too big and expensive.','The passage mentions that the first air-conditioning device installed in a private house was similar in size to an early computer and took up too much space. Additionally, later models like the Weathermaker were too expensive for most people.',1),
('Employers refused to put air conditioning in workplaces at first because they','could not afford to pay for it.|-another answer-|thought it was more suitable for cinemas.|-another answer-|did not want to spend money improving working conditions.|-another answer-|thought people would not work so hard in comfortable conditions.','did not want to spend money improving working conditions.','The passage states that money-conscious employers regarded air conditioning as a luxury. They believed that if they were paying people to work, they should not also be paying for them to be comfortable.',1),
('What was the purpose of the research done in the 1940s and �50s?','to make office workers produce more|-another answer-|to compare different types of air conditioner|-another answer-|to persuade businesses to buy air conditioners|-another answer-|to encourage employees to change offices','to persuade businesses to buy air conditioners','The research aimed to show that installing air conditioning increased productivity amongst employees. The findings, such as typists increasing their output by 24%, were used to persuade businesses to invest in air conditioning.',1),
('What does Jed Brown say about air conditioning?','In future, everyone will need it.|-another answer-|Turning it off will not reduce global warming.|-another answer-|It can seriously damage people�s health.|-another answer-|It is good for people, but bad for the environment.','It is good for people, but bad for the environment.','Jed Brown, an environmentalist, acknowledges that air conditioning provides a healthier environment for many people in the heat of summer. However, he also criticizes it for being a factor in global warming.',1),
('What do you learn about the student in the first paragraph?','He has not used the maths software before.|-another answer-|He did not expect his answer to the problem to be correct.|-another answer-|He was not initially doing the right maths problem.|-another answer-|He did not immediately know how to solve the maths problem.','He did not immediately know how to solve the maths problem.','The passage describes the student as pausing, fidgeting, and then clicking on "0 degrees" with some hesitation. This indicates that he didn''t immediately know the answer and had to think about it.',2),
('What does the writer say about the content of the Khan Academy videos?','They have been produced in a professional manner.|-another answer-|They include a mix of verbal and visual features.|-another answer-|Some of the maths problems are too easy.|-another answer-|Some of the explanations are too brief.','They include a mix of verbal and visual features.','The passage mentions that the videos consist of a voiceover by Salman Khan explaining mathematical concepts while his hand-scribbled formulas and diagrams appear on-screen. This combination of verbal and visual elements helps students understand the material.',2),
('What does this reversal refer to in line 40?','going back to spending fewer hours in school|-another answer-|students being asked to explain answers to teachers|-another answer-|swapping the activities done in the class and at home|-another answer-|the sudden improvement in students� maths performance','swapping the activities done in the class and at home','The reversal refers to the concept of "flipping" the classroom, where students watch lectures (Khan''s videos) at home and do homework (working on problem areas) in class. This inverts the traditional approach where lectures are in class, and homework is done at home.',2),
('What does the writer say about teaching to the �middle� of the class?','Teachers become too concerned about weaker students.|-another answer-|Technology has not until now provided a solution to the problem.|-another answer-|Educators have been unwilling to deal with the issues.|-another answer-|Students in this category quickly become bored.','Technology has not until now provided a solution to the problem.','The passage explains that since the rise of personal computers, educators have hoped technology could offer lessons tailored to each child, but this effort has been largely in vain until Khan Academy''s approach was introduced.',2),
('Students praise Khan ''s videos because they','show the extent of his mathematical knowledge.|-another answer-|deal with a huge range of maths problems.|-another answer-|provide teaching at different ability levels.|-another answer-|cover details that are often omitted in class.','cover details that are often omitted in class.','The passage notes that students have pointed out Khan''s ability to explain all the hidden, small steps in math problems�steps that teachers often gloss over. This detailed explanation is what students appreciate.',2),
('What is dry farming?','Preserving nitrates and moisture.|-another answer-|Ploughing the land again and again.|-another answer-|Cultivating fallow land.','Cultivating fallow land.','Dry farming involves the practice of repeatedly ploughing fallow, unproductive land to preserve nitrates and moisture, which eventually makes the land suitable for cultivation. This method of cultivating fallow land helps to conserve soil moisture and nutrients.',3),
('What did H. V. McKay do?','Export the stripper.|-another answer-|Improve the stripper.|-another answer-|Cut, collect and sort wheat.','Improve the stripper.','H. V. McKay improved the basic harvesting machine known as "the stripper". He modified it to create a complete harvester that could cut, collect, and sort wheat, thus enhancing its efficiency and utility.',3),
('What did the ''stump jump plough� innovation allow farmers to do?','Cut through tree stumps.|-another answer-|Change the wheels for a traditional plough.|-another answer-|Allow farmers to cultivate land that hadn�t been fully cleared.','Allow farmers to cultivate land that hadn�t been fully cleared.','The stump jump plough was an innovative tool that allowed farmers to cultivate land that still had tree stumps on it. This plough could navigate around the stumps, making it possible to use land that had not been fully cleared.',3),
('What did John Custance recommend?','Improving wheat yields.|-another answer-|Revitalising the industry.|-another answer-|Fertilizing the soil.','Fertilizing the soil.','John Custance recommended the use of soluble superphosphate fertilizer to address the declining wheat yields in South Australia. His advice to fertilize the soil with phosphates helped to revitalize the wheat industry.',3),
('Why was William Farrer�s wheat better?','It was drought resistant.|-another answer-|It wasn�t from England or South Africa.|-another answer-|It was drier for Australian conditions.','It was drought resistant.','William Farrer developed new wheat varieties that were better suited to the dry conditions of Australia. His wheat was more drought-resistant, making it more suitable for cultivation in Australia''s challenging climate.',3),
('What is the writer�s main purpose in the seventh paragraph?','to give reasons why adopted children were used in the study|-another answer-|to reject the view that adopted children need two languages|-another answer-|to argue that culture affects the way children learn a language|-another answer-|to justify a particular approach to language learning','to give reasons why adopted children were used in the study','The paragraph explains why internationally adopted children were ideal for testing the competing hypotheses about language learning.',4),
('Snedeker, Geren and Shafto based their study on children who','were finding it difficult to learn English.|-another answer-|had come from a number of language backgrounds.|-another answer-|were learning English at a later age than US children.|-another answer-|had taken English lessons in China.','were learning English at a later age than US children.','The study focused on adopted children who started learning English at a later age than US natives and had more mature brains.',4),
('What aspect of the adopted children''s language development differed from that of US-born children?','their first words|-another answer-|the way they learnt English|-another answer-|the rate at which they acquired language|-another answer-|the point at which they started producing sentences','the rate at which they acquired language','The paragraph mentions that the adoptees went through the same stages as typical American-born children, albeit at a faster rate.',4),
('What did the Harvard finding show?','Not all toddlers use babytalk.|-another answer-|Language learning takes place in ordered steps.|-another answer-|Some children need more conversation than others.|-another answer-|Not all brains work in the same way.','Language learning takes place in ordered steps.','The findings suggest that language learning depends on the number of words known rather than age or brain maturity, indicating an ordered step process.',4),
('When the writer says �critical period�, he means a period when.','studies produce useful results.|-another answer-|adults need to be taught like children.|-another answer-|immigrants want to learn another language.|-another answer-|language learning takes place effectively.','language learning takes place effectively.','The critical period refers to the optimal time during which language learning can proceed to full success and fluency.',4);

INSERT INTO [dbo].[Writing]
VALUES
(1,60,'The Ethical Dilemma of Profit in Health Care: Weighing the Disadvantages and Advantages of Private Health Services','Some people think that good health is a basic human need, so the medical services should not be run by profit-making companies.Do you think the disadvantages of private health care outweigh the advantages?'),
(2,60,'Breaking Barriers: The Debate on Women ''s Role in the Police and Military Forces','Some people believe that women should play an equal role as men in a country�s police force or military force, such as the army, while others think women are not suitable for these kinds of jobs. Discuss both view and give ur opinion?'),
(3,60,'The Great Sacrifice: Weighing the Pros and Cons of Relocating for Employment','In many countries, if people want to find a job, they have to get away from their families and friends.Do the advans outweigh the disadvans ?'),
(4,60,'Relocating for Work: Do the Advantages Outweigh the Disadvantages?','In many country, when people want to find work, they have to move away from their friends and their family. Advantages v� disadvantages, which is outweigh'),
(5,60,'The Role of Student Feedback: Enhancing Education or Undermining Authority?','Some people think that in order to continuously improve quality of education, high school students should be encouraged to criticise their teachers. Other think that would results in a loss of principle in class. Discussion both views and give your opinion.'),
(6,60,'The High Cost of Glory: Do Major Sporting Events Benefit or Burden Host Nations?','Hosting sporting events such as the Olympics and the World Cup can bring benefits to the host countries. Some people think it is wasted money. Discuss both view and give your own opinion.'),
(7,60,'Robots and the Future of Humanity: Catalyst for Progress or Societal Threat?','Some believe that robots play a crucial role in shaping humanity�s future, whereas others argue that they pose risks and could harm society. Consider both arguments and present your viewpoint. Explain your viewpoint with reasons and include appropriate examples based on your knowledge or experiences.'),
(8,60,'Mandatory Education Until 18: A Path to Success or an Unnecessary Constraint?','There is a belief that young individuals must attend school full-time until they are at least 18 years old. To what degree do you support or oppose this idea? Explain your viewpoint with reasons and include appropriate examples based on your knowledge or experiences.'),
(9,60,'Homeschooling vs Traditional Schooling: Do the Benefits Outweigh the Drawbacks?','Some parents in certain countries are increasingly opting to homeschool their children rather than enrolling them in traditional schools. Are the benefits of this change greater than the drawbacks? Explain your viewpoint with reasons and include appropriate examples based on your knowledge or experiences.'),
(10,60,'Government Funding for the Arts: A Worthy Investment or a Misuse of Public Funds?','Some believe that the government should support artists like musicians, painters, and poets, while others argue that this is a misuse of funds. Consider both arguments and present your viewpoint. Explain your viewpoint with reasons and include appropriate examples based on your knowledge or experiences.');

INSERT INTO [dbo].[Speaking]
VALUES
(1,15),
(2,15),
(3,15),
(4,15),
(5,15),
(6,15),
(7,15),
(8,15),
(9,15),
(10,15);

INSERT INTO [dbo].[Question_Speaking]
VALUES
(1,'Do you like challenges?'),
(1,'What is the biggest challenge in your future?'),
(1,'What subject do you think is the most challenging at school?'),
(1,'Do you like to challenge yourself?'),
(1,'Do you like to live a life that has a lot of challenges?'),
(1,'How do you usually deal with challenges in daily life?'),
(2,'Where did you go for your last holiday?'),
(2,'Do you like holidays? Why?'),
(2,'Which public holiday do you like best?'),
(2,'What do you usually do in your holidays?'),
(2,'Do you like to spend your day at home?'),
(2,'Do you prefer a leisurely or a busy holiday?'),
(3,'Do you keep plants at home?'),
(3,'What plant did you grow when you were young?'),
(3,'Do you know anything about growing a plant?'),
(3,'Do Vietnamese people send plants as gifts?'),
(4,'What�s your morning /weekend routine?'),
(4,'Do you want to change your morning routine?'),
(4,'Are there any differences between what you do in the morning now and what you did in the past?'),
(4,'What is your daily routine?'),
(4,'Have you ever changed your routine?'),
(4,'Which part of your daily routine do you like best?'),
(5,'What would you do to relax?'),
(5,'Do you think doing sports is a good way to relax?'),
(5,'Do you think vacation is a good time to relax?'),
(5,'Do you think students need more relaxing time?'),
(6,'Do you usually help people around you?'),
(6,'How do you help people around you?'),
(6,'Do your parents teach you how to help others?'),
(6,'Did your parents help you a lot when you were young?'),
(6,'What have you done to help the elderly?'),
(7,'Do you like chatting with friends?'),
(7,'What do you usually chat about with friends?'),
(7,'Do you prefer to chat with a group of people or with only one friend?'),
(7,'Do you prefer to communicate face-to-face or via social media?'),
(7,'Do you argue with friends?'),
(8,'Does your family use social media platforms?'),
(8,'Do you think Vietnamese users spend lots of time on social medias?'),
(8,'Why do people still use social media?'),
(8,'Do you use credit cards?'),
(8,'Do you think you will stop using cash in the future?'),
(9,'What is your favorite color?'),
(9,'Color is important when you choose clothes?'),
(9,'Are there any colors that have a special meaning in your country?'),
(9,'What color will you choose when buying a car in the future?'),
(10,'Do you think we need to understand computers on a deeper level?'),
(10,'What is the most impactful piece of technology in our time?'),
(10,'How do computers affect our everyday life?'),
(10,'What modern technological devices are most common in your country?'),
(10,'What are the advantages of modern technology?');
