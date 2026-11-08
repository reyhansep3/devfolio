"""Generate the one-page resume from the career details in the source CV.

Requires reportlab: python3 -m pip install reportlab
"""

from pathlib import Path

from reportlab.lib import colors
from reportlab.lib.enums import TA_LEFT
from reportlab.lib.pagesizes import A4
from reportlab.lib.styles import ParagraphStyle
from reportlab.platypus import (
    HRFlowable,
    KeepTogether,
    Paragraph,
    SimpleDocTemplate,
    Spacer,
    Table,
    TableStyle,
)


ROOT = Path(__file__).resolve().parents[1]
OUTPUT = ROOT / "web" / "Resume-Reyhan-Septri-Asta.pdf"
INK = colors.HexColor("#151715")
MUTED = colors.HexColor("#455047")
ACCENT = colors.HexColor("#C8F55A")
RULE = colors.HexColor("#D8DCD5")

name = ParagraphStyle("name", fontName="Helvetica-Bold", fontSize=26, leading=30, textColor=INK)
role = ParagraphStyle("role", fontName="Helvetica-Bold", fontSize=11, leading=16, textColor=MUTED)
contact = ParagraphStyle("contact", fontName="Helvetica", fontSize=9, leading=14, textColor=MUTED)
section = ParagraphStyle("section", fontName="Helvetica-Bold", fontSize=9.5, leading=13, textColor=INK, spaceBefore=13, spaceAfter=5)
body = ParagraphStyle("body", fontName="Helvetica", fontSize=9.5, leading=15, textColor=INK, alignment=TA_LEFT)
small = ParagraphStyle("small", parent=body, fontSize=9, leading=14)
job = ParagraphStyle("job", fontName="Helvetica-Bold", fontSize=10, leading=15, textColor=INK)
date = ParagraphStyle("date", fontName="Helvetica", fontSize=9, leading=15, textColor=MUTED)


def p(text, style=body):
    return Paragraph(text, style)


def heading(label):
    return [p(label, section), HRFlowable(width="100%", thickness=0.7, color=RULE), Spacer(1, 7)]


def bullet(text):
    return p("&#8226;  " + text, small)


def experience(title, company, dates, points):
    header = Table(
        [[p(f"{title}  |  {company}", job), p(dates, date)]],
        colWidths=[377, 125],
    )
    header.setStyle(TableStyle([
        ("VALIGN", (0, 0), (-1, -1), "TOP"),
        ("ALIGN", (1, 0), (1, 0), "RIGHT"),
        ("LEFTPADDING", (0, 0), (-1, -1), 0),
        ("RIGHTPADDING", (0, 0), (-1, -1), 0),
        ("TOPPADDING", (0, 0), (-1, -1), 0),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 2),
    ]))
    return KeepTogether([header, *[bullet(point) for point in points], Spacer(1, 8)])


story = [
    p("REYHAN SEPTRI ASTA", name),
    p("MOBILE DEVELOPER  /  FLUTTER", role),
    Spacer(1, 9),
    p(
        'Jakarta, Indonesia  |  <link href="mailto:reyhanseptri@gmail.com">reyhanseptri@gmail.com</link>'
        '  |  +62 813-7885-0755',
        contact,
    ),
    p(
        '<link href="https://www.linkedin.com/in/reyhan-septri-asta">LinkedIn</link>'
        '  |  <link href="https://github.com/reyhansep3">GitHub</link>'
        '  |  <link href="https://reyhansep3.github.io/devfolio/">Portfolio</link>',
        contact,
    ),
    Spacer(1, 12),
    HRFlowable(width="100%", thickness=3, color=ACCENT),
    *heading("PROFILE"),
    p(
        "Mobile developer with more than three years of experience building and maintaining Flutter "
        "applications for Android and iOS. Experienced in state management, REST API integration, "
        "mobile releases, and Flutter Web. Also experienced in backend API development with Go."
    ),
    *heading("TECHNICAL SKILLS"),
    p("<b>Mobile &amp; architecture:</b> Flutter, Dart, Android, iOS, Flutter Web, Provider, BLoC/Cubit, GetX, MVVM, Clean Architecture", small),
    p("<b>Backend &amp; integration:</b> Go, Laravel, PHP, REST APIs, WebSocket, Dio, Firebase, PostgreSQL, Xendit", small),
    p("<b>Other tools:</b> JavaScript, React, Python, Git, Android Studio, Xcode, Figma, Jira, Postman, Insomnia", small),
    *heading("PROFESSIONAL EXPERIENCE"),
    experience("Mobile Developer (Contract)", "PT CKL Cargo", "Aug 2023 - Present", [
        "Develop and maintain Flutter HRIS and driver-management apps for HR and logistics operations.",
        "Publish Android and iOS releases and work with design, backend, and QA teams to deliver features and fixes.",
        "Apply Provider, BLoC/Cubit, MVVM, and Clean Architecture; use Firebase Crashlytics to investigate issues and adapt a mobile app for Flutter Web.",
    ]),
    experience("Mobile Developer (Freelance)", "Astabyte", "Oct 2024 - Jul 2025", [
        "Developed and deployed an Android and iOS spa-booking app with Xendit in-app payments.",
        "Collaborated with designers and backend developers on feature integration and app stability.",
    ]),
    experience("Mobile Developer (Intern)", "Loker Programmer", "Jul - Oct 2023", [
        "Built and improved Flutter Android features using GetX and REST API integration.",
    ]),
    experience("Mobile Developer (Intern)", "Mobile Innovation", "Nov 2021 - Jan 2022", [
        "Prototyped a Flutter mental-health app with designers and a business analyst, using Provider, MVVM, and REST APIs.",
    ]),
    *heading("EDUCATION"),
    p("<b>Telkom University</b> - Bachelor of Informatics, 2019 - 2023 | GPA: 3.69/4.00", small),
    *heading("TRAINING"),
    p("<b>Altera Academy</b> - Flutter Mobile Developer, Feb - Jul 2022. Collaborated across mobile, web, backend, and QA on a Flutter app using Provider, Firebase, and REST APIs.", small),
    p("<b>Sanbercode</b> - Flutter Mobile Developer, Aug - Sep 2021. Built a Flutter front end with Firebase integration.", small),
    p("<b>Microcredential Data Scientist Associate Training</b> - Nov 2021 - Jan 2022. Completed a team Python and AI project deployed to Heroku.", small),
]


def page_decoration(canvas, doc):
    canvas.saveState()
    canvas.setFillColor(colors.white)
    canvas.rect(0, 0, A4[0], A4[1], stroke=0, fill=1)
    canvas.setFillColor(INK)
    canvas.rect(0, A4[1] - 7, A4[0], 7, stroke=0, fill=1)
    canvas.setStrokeColor(RULE)
    canvas.line(46, 36, A4[0] - 46, 36)
    canvas.setFont("Helvetica", 7)
    canvas.setFillColor(MUTED)
    canvas.drawString(46, 24, "REYHAN SEPTRI ASTA  /  MOBILE DEVELOPER")
    canvas.drawRightString(A4[0] - 46, 24, "1 / 1")
    canvas.restoreState()


doc = SimpleDocTemplate(
    str(OUTPUT),
    pagesize=A4,
    leftMargin=46,
    rightMargin=46,
    topMargin=31,
    bottomMargin=49,
    title="Reyhan Septri Asta | Mobile Developer Resume",
    author="Reyhan Septri Asta",
)
doc.build(story, onFirstPage=page_decoration, onLaterPages=page_decoration)
print(OUTPUT)
