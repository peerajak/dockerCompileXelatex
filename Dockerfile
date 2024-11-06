FROM ubuntu:20.04

ENV LANG=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update &&\
    apt install -f -y \
    make \
    texlive-xetex \
    fonts-font-awesome \
    texlive-base\
    texlive-bibtex-extra\
    texlive-science\
    git


COPY * ./

CMD ["tlmgr","install","breakcites"]
CMD [ "xelatex", "-synctex=1", "-interaction=nonstopmode", "-interaction=nonstopmode","-8bit", "-output-directory=log","Proposal.tex" ]

