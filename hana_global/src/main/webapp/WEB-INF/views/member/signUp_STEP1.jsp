<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Hana2.0+B&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Hana2.0+H&display=swap" rel="stylesheet"/>
    <!-- Bootstrap 5 CSS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <!-- Stepper Styles -->
    <link rel="stylesheet" href="./css/step-box.css">
    <link rel="stylesheet" href="./css/terms.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
            crossorigin="anonymous"></script>

    <link href="./css/main.css" rel="stylesheet"/>
    <link href="./css/header.css" rel="stylesheet"/>
    <link href="./css/TTF.css" rel="stylesheet"/>
    <link href="./css/main-body.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <title>회원가입 step 1 약관동의 </title>
</head>
<body>
<div class="main-container">
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <main>

        <%@ include file="/WEB-INF/views/includes/stepper.jsp" %>
        <div class="content">
            <%--        약관 헤더 박스--%>
            <div class="title-area clearfix">
                <h3 class="fleft">Electronic Financial Transactions Terms and Conditions</h3>

            </div>
            <%--        약관 내용 박스--%>
            <div class="agree-box" tabindex="0">
                <div class="agree-txt">
                    <div class="agree-txt">
                        <h4 class="font-13 pb0 font-normal">Special Terms & Conditions for Easy-One Pack Account</h4>
                        <h6>
<%--                            <pre>--%>
<%--'제 1 조 (목적)--%>
<%--① 이 약관은 (주)하나은행(이하 은행이라 함)과 은행이 제공하는 전자금융서비스 (인터넷뱅킹,--%>
<%--모바일뱅킹, 폰뱅킹 등 이하 서비스라 함)를 이용하고자 하는 이용자 (이하 이용자라 함) 간의--%>
<%--서비스 이용에 관한 제반 사항을 정함을 목적으로 합니다.--%>
<%--② 이 약관에서 정하지 아니한 사항은 전자금융거래법 및 관계법령, 전자금융거래 기본약관 (이하--%>
<%--‘기본약관’이라 함), 기타 관련 약관 및 규약을 적용합니다.--%>
<%--제 2 조 (정의)--%>
<%--이 약관에서 사용하는 용어의 정의는 다음과 같습니다.--%>
<%--① “보안매체”라 함은 은행이 이용자의 전자금융 거래 시 이용자 본인확인을 위하여 교부하는--%>
<%--접근매체로서 자물쇠카드 또는 일회용비밀번호발생기(OTP) 등을 말합니다.--%>
<%--② “인증서”라 함은 전자금융거래 시 이용자 본인확인을 위하여 인증기관으로부터 발급받은--%>
<%--전자서명키를 담고 있는 전자적 정보를 말합니다.--%>
<%--③ “이용자 비밀번호”라 함은 은행이 이용자의 전자금융 거래 시 이용자 본인확인을 위하여 필요로 하는--%>
<%--비밀번호로서 전자금융 신청 시 이용자가 직접 등록하는 비밀번호를 말합니다.--%>
<%--④ “생체인증”이라 함은 이용자가 본인의 스마트폰에 미리 저장해 둔 생체정보(생체에서 발생하는 홍채,--%>
<%--지문 등의 정보)를 이용하여 스마트폰뱅킹의 로그인 또는 계좌이체 등 이체성 거래 시 인증서 대신--%>
<%--사용할 수 있는 본인인증 수단을 말합니다.--%>
<%--⑤ 기타 이 약관에서 정의하지 아니하는 용어는 전자금융거래법 및 관계법령, 기본약관, 기타 관련 약관--%>
<%--및 규약에서 정하는 바에 따릅니다.--%>
<%--제 3 조 (서비스 종류)--%>
<%--이 약관에 의해 제공되는 서비스는 각종 조회, 자금이체, 신규계좌 개설, 대출실행, 자동이체등록, 공과금--%>
<%--수납, 사고신고, 환전, 해외송금 등입니다.--%>
<%--제 4 조 (서비스의 신청, 해지 및 추가)--%>
<%--① 이용자는 서비스 신청서를 은행에 서면 또는 전자적 장치를 통해 제출하고 은행이 이를 확인,--%>
<%--승낙함으로써 계약이 성립합니다. 다만, 자금의 이체가 수반되지 않는 거래나 단순조회 등의--%>
<%--서비스는 전자금융거래 계약 체결 없이 이용할 수 있습니다.--%>
<%--② 기존의 서비스 이용자는 별도의 서면신청 없이 서비스 상에서의 신청 및 확인절차를 거쳐 이용가능--%>
<%--서비스 매체를 추가할 수 있습니다.--%>
<%--제 5 조 (이용자확인방법)--%>
<%--① 기본약관 제4조 1항 에 의하여 이용자가 전자금융거래계약 체결 절차 없이 이용할 수 있는 서비스는--%>
<%--관련 계좌 (카드)번호와 계좌 (카드) 비밀번호가 일치하면 본인(미성년자는 법정대리인 포함)으로--%>
<%--인정합니다.--%>
<%--준법감시인 심의필 제2023-약관-071호(2023.5.4)--%>
<%--② 은행은 다음 각 항목과 같이 서비스 종류별로 은행이 요구하는 해당 항목을 이용자가 입력했을 때--%>
<%--동 내용이 은행에 등록된 자료와 일치할 경우 본인(미성년자는 법정대리인 포함)으로 인정하여--%>
<%--서비스를 제공합니다. 단, 보안상 필요에 의해 은행이 본인확인을 위한 항목을 추가로 요구할 수--%>
<%--있으며, 스마트폰뱅킹의 경우에는 이용자가 생체인증 사용을 등록한 본인 명의의 스마트폰에 입력한--%>
<%--생체정보와 스마트폰에 사전 저장된 생체정보가 일치할 경우에도 본인으로 간주하여 서비스를--%>
<%--제공합니다.--%>
<%--1. 폰뱅킹:--%>
<%--이용자비밀번호, 계좌(카드)번호, 계좌(카드)비밀번호, 자물쇠카드의 코드번호 또는 일회용 비밀번호--%>
<%--발생기(OTP)에서 생성되는 비밀번호--%>
<%--2. 모바일뱅킹:--%>
<%--이용자 ID, 이용자비밀번호, 계좌(카드)번호, 계좌(카드)비밀번호, 자물쇠카드의 코드번호 또는--%>
<%--일회용비밀번호발생기(OTP)에서 생성되는 비밀번호, 은행이 정한 인증서--%>
<%--3. 인터넷뱅킹:--%>
<%--이용자 ID, 이용자비밀번호, 계좌(카드)번호, 계좌(카드)비밀번호, 자물쇠카드의 코드번호 또는--%>
<%--일회용비밀번호발생기(OTP)에서 생성되는 비밀번호, 은행이 정한 인증서--%>
<%--제 6 조 (계좌의 개설 및 해지)--%>
<%--① 이용자는 본인명의 자유입출금식예금(신탁)계좌(이하 근거계좌라 함)를 근거로 하여 서비스를 통해--%>
<%--계좌(이하 연결계좌라 함)를 신규개설 또는 해지할 수 있습니다.--%>
<%--② 연결계좌는 인감 또는 서명신고를 생략하고 통장발급을 하지 않으며 통장발급을 원할 경우에는--%>
<%--영업점을 방문하여 실명확인절차를 거친 후 발급할 수 있습니다.--%>
<%--③ 실명확인을 거친 은행에서 신규한 계좌는 서비스를 통해 해지할 수 있습니다. 이때 해지된 금액은--%>
<%--본인의 출금계좌 중 지정한 계좌로 입금됩니다. 단, 콜센터 상담사를 통해 거래중지계좌 및 만기가--%>
<%--도래하여 재예치를 위해 해지하는 경우에는 본인이 지정한 실명확인 된 계좌로 입금됩니다.--%>
<%--④ 실명확인을 거치지 아니한 연결계좌의 해지금액은 근거계좌로 입금됩니다.--%>
<%--⑤ 근거계좌는 연결계좌의 실명확인절차를 거치기 이전까지는 해지할 수 없습니다.--%>
<%--⑥ 인터넷과 전화를 통한 예금 또는 적금의 해지 시에는 제 5조 2 항 단서에 따라 은행은 상담원의--%>
<%--이용자에 대한 전화 통화나 휴대폰 인증번호, ARS 인증번호를 이용자확인방법으로 추가 합니다.--%>
<%--제 7 조 (출금계좌 및 입금계좌)--%>
<%--① 계좌이체에 이용할 출금계좌는 이용자가 본인명의의 자유입출금식예금(신탁) 계좌 중에서 은행에--%>
<%--서면으로 지정하여야 합니다. 단, 다음 각 호의 경우에는 전자적 장치를 이용하여 출금계좌를 지정할--%>
<%--수 있습니다.--%>
<%--1. 이용자가 전자적 장치를 이용하여 출금계좌를 지정하기로 서면으로 동의한 경우--%>
<%--2. 대면 실명확인을 거친 후 휴대용 전자기기를 이용하여 전자금융 서비스에 가입한 경우--%>
<%--3. 비대면 실명확인을 통해 지정하는 경우--%>
<%--② 이용자는 입금계좌를 은행에 서면 또는 전자적 장치를 통해 지정할 수 있습니다. 단, 입금계좌를--%>
<%--지정하지 않은 경우에는 불특정계좌에 입금할 수 있습니다.--%>
<%--제 8 조 (자금이체한도)--%>
<%--준법감시인 심의필 제2023-약관-071호(2023.5.4)--%>
<%--이용자는 은행이 <표 1-1> 과 <표 1-2> 에서 정한 보안등급별 자금이체한도와 거래이용수단에 따라--%>
<%--계좌이체한도를 설정하여야 합니다. 다만 해외거주자 또는 비대면 실명확인을 통해 신규한 경우에는--%>
<%--다르게 정할 수 있으며 구체적인 내용은 해당 전자금융거래를 수행하는 전자적 장치 등을 통해--%>
<%--안내합니다.--%>
<%--< 표 1-1: 전자금융 보안등급별 자금이체한도 >--%>
<%--(단위: 백만원)--%>
<%--구 분--%>
<%--보안등급별 기본한도--%>
<%--영업점장 승인--%>
<%--1 등급 2 등급--%>
<%--인터넷뱅킹--%>
<%--(모바일뱅킹--%>
<%--포함)--%>
<%--개인--%>
<%--1 회 100 10 제한없음--%>
<%--1 일 500 10 제한없음--%>
<%--법인--%>
<%--1 회 1,000 - 제한없음--%>
<%--1 일 5,000 - 제한없음--%>
<%--폰뱅킹--%>
<%--개인--%>
<%--1 회 50 10 제한없음--%>
<%--1 일 250 10 제한없음--%>
<%--법인--%>
<%--1 회 100 - 제한없음--%>
<%--1 일 500 - 제한없음--%>
<%--* 1 등급 한도 이용 고객과 점자 자물쇠카드 이용고객은 영업점장의 승인을 받아 별도 한도를 이용할 수--%>
<%--있습니다.--%>
<%--* 모바일뱅킹은 인터넷뱅킹과 합산하여 한도 관리함.--%>
<%--< 표 1-2: 전자금융 보안등급별 거래이용수단 >--%>
<%--거래이용수단 보안등급--%>
<%--OTP 발생기 + (은행이 정한 인증서 또는 생체인증) 1 등 급--%>
<%--자물쇠카드 + (은행이 정한 인증서 또는 생체인증) 2 등 급--%>
<%--* 폰뱅킹은 은행이 정한 인증서 및 생체인증 제외함--%>
<%--제 9 조 (거래지시 처리기준)--%>
<%--‘기본약관’에 추가하여 다음과 같이 처리합니다.--%>
<%--1. 출금계좌에서의 출금은 해당 예금약관이나 약정서에 불구하고 소정의 지급청구서 또는 수표없이--%>
<%--처리하며, 그 금액은 이체시점에서 현금화된 예금잔액(대출한도 포함)에 한합니다.--%>
<%--2. 이용자는 수시로 잔액조회 또는 통장정리 등을 통하여 거래의 이상 유무를 확인하여야 합니다.--%>
<%--3. 예약이체는 이체지정일에 1회의 실행으로 종료하며 이체지정일에 다수의 이체처리 건이 있을 때--%>
<%--처리순서는 은행에서 정한 바에 따릅니다.--%>
<%--4. 폰뱅킹의 경우 이용자는 제3조의 서비스를 상담원을 통해 제공받을 수 있습니다.--%>
<%--제 10 조 (대출 서비스)--%>
<%--① 이용자가 서비스를 통해 대출을 받고자 할 경우에는 별도의 약정을 체결한 후 할 수 있습니다.--%>
<%--② 제1항의 약정은 서류 없이 서비스를 통해 할 수 있습니다.--%>
<%--준법감시인 심의필 제2023-약관-071호(2023.5.4)--%>
<%--③ 이용자가 서비스를 통해 신청하는 경우 제 5 조의 이용자 확인방법을 통하여 동일성 여부를--%>
<%--확인하여 거래지시의 내용대로 처리한 경우에는 그 처리한 내용대로 약정이 체결된 것으로 봅니다.--%>
<%--④ 인터넷과 전화를 통한 대출 실행 시에는 제5조 2항 단서에 따라 은행은 상담원의 이용자에 대한--%>
<%--전화 통화나 휴대폰 인증번호, ARS인증을 이용자 확인방법으로 추가합니다.--%>
<%--제 11 조 (이용 수수료)--%>
<%--이용수수료는<표 2>에서 정한 바와 같으며 이용자에게 각종 서비스 종료와 동시에 이용자의--%>
<%--출금계좌에서 자동출금하기로 합니다.--%>
<%--<표 2: 전자금융 서비스 이용 수수료>--%>
<%--구분 당행이체 타행이체 비고--%>
<%--인터넷뱅킹--%>
<%--모바일뱅킹--%>
<%--무료 500 원--%>
<%--은행 고객등급별--%>
<%--수수료 감면 제공--%>
<%--폰뱅킹--%>
<%--ARS 무료 500 원--%>
<%--상담원 무료 500 원--%>
<%--제 12 조 (서비스 별 이용시간)--%>
<%--서비스 별 이용시간은 ‘은행’의 인터넷 홈페이지 또는 해당 전자금융거래를 수행하는 전자적 장치 등을--%>
<%--통해 안내합니다. 이용시간 변경 시 변경내용을 본 약관 제 17 조에 준하여 통지합니다.--%>
<%--제 13 조 (비밀번호, 자물쇠카드 및 생체정보의 관리)--%>
<%--① 이용자는 영업점에서 서비스 신청 시 핀패드(PIN-PAD)를 이용하여 이용자비밀번호를 직접--%>
<%--입력하여야 하며, 서비스 신청 시 지급되는 보안매체와 함께 이 비밀번호가 은행직원을 포함한--%>
<%--누구에게도 유출, 누설되지 않도록 하여야 합니다. 다만 이용자는 전자적 장치를 통해 이용자--%>
<%--비밀번호를 사후에 등록할 수 있습니다.--%>
<%--② 이용자비밀번호의 조회나 확인은 불가능하며, 비밀번호를 잊어버렸을 경우에는 영업점에서 재등록--%>
<%--신청을 하거나, 은행이 정한 인증 절차를 거쳐 전자적 장치를 통해 재등록 할 수 있습니다.--%>
<%--③ 보안매체의 분실 또는 타인에게 보안매체의 내용이 유출되었다고 판단 시 즉시 서면 또는 전자적--%>
<%--수단을 이용하여 사고신고를 하여야 하며, 관련된 서비스를 계속 이용하기 위해서는 영업점에서--%>
<%--보안매체를 재발급 받아야 합니다.--%>
<%--④ 자물쇠카드는 가급적 개인 PC 에 스캔하여 이미지로 보관하거나 자물쇠카드의 비밀번호를 엑셀파일--%>
<%--등으로 저장하여서는 아니 되며 온라인 포탈 등의 메일함에도 보관하지 않아야 합니다.--%>
<%--⑤ 이용자가 생체인증을 위해 본인 명의의 스마트폰에 생체정보를 저장할 때는 반드시 타인이 아닌--%>
<%--본인의 생체정보를 사용해야 하며, 저장된 생체정보는 유출되지 않도록 해야 합니다. 만약, 저장된--%>
<%--생체정보가 타인에게 유출되었다고 판단 시 즉시 스마트폰뱅킹을 통하여 생체정보 등록을 해지해야--%>
<%--합니다.--%>
<%--제 14 조 (서비스의 제한)--%>
<%--① 은행은 다음의 경우 당해 거래를 제한할 수 있습니다.--%>
<%--1. ‘기본약관’의 “제14조(거래의 제한) 제1항 및 제2항의 각호”에 해당되었을 때--%>
<%--준법감시인 심의필 제2023-약관-071호(2023.5.4)--%>
<%--2. 본인확인을 위한 이용자비밀번호 또는 자물쇠카드코드번호가 일자에 관계없이 누적하여 연속 5회,--%>
<%--또는 출금계좌의 비밀번호가 일자에 관계없이 누적하여 연속3회 잘못 입력되었을 때, 또는--%>
<%--일회용비밀번호발생기(OTP)를 사용하는 경우 일회용비밀번호발생기(OTP)에서 생성되는--%>
<%--비밀번호를 전 금융기관을 합하여 일자에 관계없이 누적하여 연속 10회 잘못 입력되었을 때,--%>
<%--생체인증 시 누적하여 연속 5회 일치하지 않을 때--%>
<%--② 은행은 제 1 항에 의해 거래를 제한한 경우에는 이용자의 거래지시가 있을 때 해당 전자적장치를--%>
<%--통하여 그 사유를 알려야 합니다.--%>
<%--제 15 조 (서비스의 변경 및 해지)--%>
<%--① 이용자가 서비스 이용을 변경 또는 해지하고자 할 때에는 은행의 영업점 또는 해당 서비스를 통해--%>
<%--신청서를 제출하고 이에 따라 은행이 변경, 해지처리를 함으로써 서비스 이용계약은 변경,--%>
<%--해지됩니다.--%>
<%--② 각종 비밀번호를 변경하고자 할 경우에는 은행에 신청서를 제출하거나 전자적 장치를 통하여 변경할--%>
<%--수 있습니다.--%>
<%--제 16 조 (사고신고)--%>
<%--제 14 조 ①항 2 호의 사유로 이용 중지되었을 경우에는 영업점에 서면으로 신고하여야 합니다.--%>
<%--제 17 조 (약관변경)--%>
<%--① 은행이 이 약관을 변경하고자 하는 경우에는 변경 1개월 전에 그 내용을 해당 전자금융거래를--%>
<%--수행하는 전자적 장치(해당 전자적 장치에 게시하기 어려울 경우에는 이용자가 접근하기 용이한--%>
<%--전자적 장치) 및 영업점에 게시하고 이용자에게 통지하여야 합니다. 다만, 이용자가 이의를 제기할--%>
<%--경우 은행은 이용자에게 적절한 방법으로 약관 변경내용을 통지하였음을 확인해 주어야 합니다.--%>
<%--② 제1항에도 불구하고 법령의 개정으로 인하여 긴급하게 약관을 변경한 때에는 변경된 약관을 전자적--%>
<%--장치에 최소 1개월 이상 게시하고 이용자에게 통지하여야 합니다.--%>
<%--③ 은행이 제1항 및 제2항의 게시하거나 통지를 하는 경우에는 “이용자가 약관의 변경내용이--%>
<%--게시되거나 통지된 후부터 변경되는 약관의 시행일 전의 영업일까지 이내에 계약을 해지할 수--%>
<%--있으며, 약관의 변경내용에 이의를 제기하지 아니하는 경우 약관의 변경내용에 승인한 것으로--%>
<%--본다.”라는 취지의 내용을 통지하여야 합니다.--%>
<%--④ 이용자는 약관의 변경내용이 게시되거나 통지된 후부터 변경되는 약관의 시행일전의 영업일까지--%>
<%--전자금융거래의 계약을 해지할 수 있고, 약관의 변경내용에 대하여 이의를 제기하지 아니하는--%>
<%--경우에는 약관의 변경을 승인한 것으로 봅니다.--%>
<%--제 18 조 (합의관할)--%>
<%--서비스 이용과 관련하여 은행과 이용자 사이에 소송의 필요가 있을 경우 관할법원은 민사소송법에서--%>
<%--정하는 바에 따릅니다.--%>
<%--준법감시인 심의필 제2023-약관-071호(2023.5.4)--%>
<%--<부칙>--%>
<%--제 1 조 (경과조치)--%>
<%--2013 년 12 월 3 일 전자금융이체한도 개정 전 가입하고 개정 후 이체한도 변경이 없는 고객 중 해외--%>
<%--거주자는 전자금융거래를 수행하는 전자적 장치를 통한 예외 신청으로 신청일 당일에 한하여 개정 전--%>
<%--가능한 전자금융이체한도를 이용할 수 있습니다.--%>
<%--                            </pre>--%>
                            <pre>
Article 1. Scope
Easy-One Pack Passbook(hereinafter “Account”) shall be subject to this Special Terms & Conditions,
and matters not stipulated otherwise herein shall be subject to the General Terms & Conditions for
Deposit Transaction and the Terms & Conditions for Free-Savings Deposit.

Article 2. Account Type
The type of this Account shall be savings deposit.

Article 3. Eligibility
Individual foreigners using real name and sole proprietors with nationalities shall be eligible for this
Account.

Article 4. Opening Amount
There shall be no limit on the opening amount of this Account.

Article 5. Deposit Period
There shall be no limit to the deposit period of this Account.

Article 6. Applicable Interest Rate
① The interest rate for this Account shall be the interest rates for savings deposit disclosed at the
branches and on the Bank website on the date of account opening.
② Interest shall be added to the principal on the day immediately following the third Friday of
every March, June, September and December (the “Interest Date”).
③ Interest shall be calculated for the period between the initial date of deposit (or the last
Interest Date) and the day immediately before the Interest Date. Interest shall be calculated
on the daily final balance at the interest rate disclosed at the branches and on the Bank
website every business day in accordance with each of the following classifications.
④ Applicable interest rate for this Account, depending on whether the daily final balance is
KRW 50,000,000 or more, may vary and the changed interest rate shall apply from the date
of change.

Article 7. Provision of Preferential Service
① In the event account holder satisfies each of the following conditions respectively, each
preferential service shall be provided.
② Preferential Service 1 shall be as follows :
1. Conditions : Record of settling bills of Hana Card’s credit/check card through this
Account
2. Service details (limited to transaction using this Account)
- Fee exemption for transfer to other banks via electronic banking (Note 1)
(Note 1) Internet Banking, Telebanking, Mobile Banking, Smartphone Banking
 - Fee exemption for withdrawal via KEB Hana Bank’s CD/ATMs
 3. Preferential Service 1 shall be provided for customers satisfying the applicable conditions
during the previous month.
③ Preferential Service 2 shall be as follows :
1. Conditions : Record of salary transfer (see Note below) to this Account or deposit of
KRW300,000 or more in the Easy-One Pack Installment Deposit under ther Customer’s
name during the previous month
(Note) Conditions for Salary Transfer
Standards •Depositing in Instant-Access Deposit Account and meeting any of the followings
-If one of the following deposit codes for salary is specified
(Code: geubyeo (‘salary’), wolgeup (‘monthly pay’), bongeup(wage),
yeonbong(annual salary), geupryo(pay), sangyeo(‘bonus’), seonggwa(merit-based
pay), wolbosu(monthly pay), ‘salary,’ ‘ pay’ ‘bonus’)
-If such funds are deposited within a business day before/after the designated
salary transfer date
Amount •At least KRW 500,000 or more per transfer
Cases not
recognized
•All transaction channels are recognized, except the followings :
-Salary transfer via terminal by the counter staff (but, multiple salary deposits at
the counter are recognized as a Salary Transfers.)
-Salary transfers via ATMs (but, transfer by other person is recognized as a Salary
Transfers.)
•Salary transfers incidental to financial transaction such as payment to merchant,
loan linkage, outward remittance, etc. are excluded.
•Salary transfer presumed to be made by the customer himself excluded.
2.Services Details (limited to transactions using this Account)
-Fee exemption for Preferential Service 1
-Fee exemption for withdrawal from the Bank’s account via other bank’s CD/ATMs (10 times a month)
(limited to ATMs located in branches and ATMs located out of branches but directly managed by the
Bank)
3. Preferential Service 2 shall be provided to customer having a record of salary transfer during the
previous month or the month before last, or a record of depositing KRW 300,000 or more in the EasyOne Pack Installment Deposit under the customer’s name in the previous month.
④ Special condition for preferential service: Preferential Service 1 and Preferential Service 2 shall be
provided from the enrollment date to the end of the next month regardless of whether conditions are
satisfied or not.
Addendum (Enactment)
This Special Terms & Conditions shall become effective from April 8, 2013.
(Change of Product Name) The product name shall change to “Easy-One Pack Passbook” from
“Rainbow Passbook” from the effective date of change.
(Interim Measures) Preferential Service 2 under Paragraph 3 of Article 7 shall be also provided to
customers enrolled in this Account prior to the effective date of change if they satisfy the conditions.
Addendum (1)
This Special Terms & Conditions as revised shall become effective from Sept. 4, 2013.
(Interim Measures) For customers enrolled in this Account prior to the effective date of change,
preferential services shall be provided if they satisfy the conditions under Article 7 after the effective
date of change.
Addendum(2)
This Special Terms & Conditions as revised shall become effective from Aug. 1, 2015.
Addendum(3)
This Special Terms & Conditions as revised shall apply to the customers existing as of June 7, 2016
and become effective from June 7, 2016.
                            </pre>
                        </h6>
                    </div>
                </div>
            </div>

            <%--        약관 헤더 박스--%>
            <div class="title-area clearfix">
                <h3 class="fleft">Privacy Policy</h3>
            </div>
            <%--        약관 내용 박스--%>
            <div class="agree-box" tabindex="0">
                <div class="agree-txt">
                    <div class="agree-txt">
                        <h4 class="font-13 pb0 font-normal">Hana Global by Hana Bank Privacy Policy</h4>
                        <h6>
<%--                            <pre style="max-width: 840px; white-space:pre-line">--%>
<%--하나은행(이하 “당행”이라 합니다)은 개인정보보호법 제30조에 따라 고객의 개인정보 및 권익을 보호하고 개인정보와--%>
<%--관련한 고객의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.--%>
<%--제1조(개인정보의 처리 목적)--%>

<%--당행은 개인정보를 다음 각 호의 목적을 위해 처리합니다. 수집된 개인정보는 다음의 목적 외의 용도로는 사용되지--%>
<%--않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.--%>

<%--1. (금융)거래 관계 관련--%>

<%--(금융)거래와 관련하여 신용정보회사 또는 신용정보집중기관에 대한 개인신용정보의 조회, (금융)거래 관계의 설정 여부의 판단,--%>
<%--(금융)거래 관계의 설정·유지·이행·관리, 금융사고 조사, 분쟁 해결, 민원 처리 및 법령상 의무이행 등의 목적으로 개인정보를 처리합니다.--%>
<%--※ (금융)거래라 함은 은행업무(여신, 수신, 내·외국환), 겸영업무(펀드, 신탁, 파생상품, 방카슈랑스, 신용카드, 마이데이터 서비스 등)--%>
<%--및 부수업무(팩토링, 보호예수, 수납 및 지급대행, 대여금고, 상품권 등 판매대행 등)와 이와 관련된 거래를 의미합니다.--%>

<%--2. 상품 및 서비스 홍보 및 판매 권유--%>
<%--고객 만족도 조사를 통한 신규 서비스 개발 및 맞춤 서비스 제공, 인구통계학적 특성에 따른 서비스 제공 및 광고의 게재,--%>
<%--서비스의 유효성 확인, 경품지급, 사은행사 등 고객의 편의 및 참여기회 제공, 접속빈도 파악, 회원의 서비스이용에 대한 통계 등의 목적으로 개인정보를 처리합니다.--%>

<%--3. 회원 가입 및 관리--%>
<%--회원가입, 회원제 서비스 이용, 제한적 본인 확인제에 따른 본인확인, 개인식별, 부정이용방지, 비인가 사용방지, 가입의사 확인, 만14세 미만 아동 개인정보 수집 시 법정대리인 동의여부 확인, 추후 법정 대리인 본인확인, 사고조사, 분쟁해결, 민원처리 및 고지사항 전달 등의 목적으로 개인정보를 처리합니다.--%>

<%--4. 온라인 거래 관련 목적--%>

<%--전자금융거래법 제21조, 제22조에 의해 전자금융거래의 내용 추적 및 검색, 보안정책 수립용 통계 자료로 활용 등을 목적으로 개인정보를 처리합니다.--%>
<%--제2조(개인정보의 처리 및 보유 기간)--%>

<%--① (금융)거래와 관련한 개인(신용)정보는 수집·이용에 관한 동의일로부터 (금융)거래 종료일로부터 5년까지 위 이용목적을 위하여 보유·이용됩니다. 단, (금융)거래 종료일 이후에는 금융사고 조사, 분쟁 해결, 민원처리, 법령상 의무이행 및 당행의 리스크 관리업무만을 위하여 보유·이용됩니다.--%>
<%--② 개인(신용)정보의 조회를 목적으로 수집된 개인(신용)정보는 수집·이용에 대한 동의일로부터 고객에 대한 신용정보 제공·조회 동의의 효력 기간까지 보유·이용됩니다. 단, 신용정보 제공ㆍ조회 동의의 효력 기간 종료 후에는 금융사고 조사, 분쟁 해결, 민원처리 및 법령상 의무이행만을 위하여 보유·이용됩니다.--%>
<%--③ 상품 및 서비스 홍보 및 판매 권유 등과 관련한 개인(신용)정보는 수집·이용에 관한 동의일로부터 동의 철회일까지 보유·이용됩니다. 단, 동의 철회일 후에는 제1조의 목적과 관련된 사고 조사, 분쟁 해결, 민원처리, 법령상 의무이행만을 위하여 보유·이용됩니다.--%>
<%--④ 회원 가입 및 관리 목적으로 수집된 개인(신용)정보는 고객의 회원 가입일로부터 회원 탈퇴일까지 보유·이용됩니다. 단 회원 탈퇴일 후에는 제1조의 목적과 관련된 사고 조사, 분쟁 해결, 민원처리, 법령상 의무이행 만을 위하여 보유·이용됩니다.--%>
<%--⑤ 온라인 거래 관련한 개인(신용)정보는 전자금융거래법 시행령 제12조에서 정하는 기간까지 보유·이용됩니다.--%>
<%--⑥ 마이데이터 서비스(본인신용정보관리업) 의 전송요구권을 통해 수집된 개인(신용)정보는 고객이 지정한 보유기간까지 보유·이용됩니다.--%>
<%--제3조(개인정보 수집 출처 등 고지)--%>

<%--① 당행은 정보주체 이외로부터 수집한 개인정보를 처리하는 때에는 정당한 사유가 없는 한 정보주체의 요구가 있은 날로부터 3영업일 이내에 수집 출처, 처리 목적, 개인정보 처리의 정지를 요구할 권리가 있다는 사실을 정보주체에게 알립니다.--%>
<%--② 개인정보 보호법 제20조제4항 각 호에 근거하여 제1항에 따른 정보주체의 요구를 거부하는 경우에는, 정당한 사유가 없는 한 정보주체의 요구가 있은 날로부터 3영업일 이내에 그 거부의 근거와 사유를 정보주체에게 알립니다.--%>
<%--제4조(개인정보의 제3자 제공)--%>

<%--① 당행은 원칙적으로 고객의 개인정보를 제1조에서 명시한 목적 범위 내에서 처리하며, 고객의 사전 동의 없이는 본래의 범위를 초과하여 처리하거나 제3자에게 제공하지 않습니다. 단, 다음의 각 호의 경우에는 고객 또는 제3자의 이익을 부당하게 침해할 우려가 있을 때를 제외하고는 개인정보를 목적 외의 용도로 이용하거나 이를 제3자에게 제공할 수 있습니다.--%>
<%--1. 고객이 사전에 제3자 제공 및 공개에 동의한 경우--%>
<%--2. 다른 법률에 특별한 규정이 있는 경우--%>
<%--3. 고객 또는 그 법정대리인이 의사표시를 할 수 없는 상태에 있거나 주소불명 등으로 사전 동의를 받을 수 없는 경우로서 명백히 고객 또는 제3자의 급박한 생명, 신체, 재산의 이익을 위하여 필요하다고 인정되는 경우--%>
<%--② 당행은 다음 각호와 같이 개인정보를 제공하고 있습니다.--%>
<%--1. 신용정보집중기관*, 신용정보회사*에 대한 제공--%>
<%--이용목적--%>
<%---금융기관에 대한 신용정보를 집중 수입, 보관, 제공--%>
<%---신용을 판단하기 위한 자료로 활용하거나 공공기관에서 정책자료로 활용--%>
<%---기타 동법 및 다른 법률의 규정에서 정한 사항--%>
<%--제공하는 신용정보의 종류--%>
<%---개인식별정보, 신용거래정보, 신용능력정보, 신용도판단정보, 기타 신용평가를 위한 정보--%>
<%--* 신용정보집중기관 : 한국신용정보원--%>
<%--* 신용정보회사 : SCI평가정보, 코리아크레딧뷰로(주), 나이스평가정보㈜, 한국기업데이터㈜, 나이스디앤비㈜, ㈜이크레더블 등--%>
<%--2. 제휴업체--%>
<%--홈페이지>고객센터>개인정보처리방침>개인(신용)정보처리 위탁 및 제공 현황에서 확인할 수 있습니다.--%>
<%--상세내역보기--%>
<%--③ 개인(신용)정보는 제공된 날로부터 동의 철회 시 또는 제공된 목적을 달성할 때까지 보유·이용됩니다. 동의 철회 또는 제공된 목적 달성 후에는 위에 기재된 이용목적과 관련된 금융사고 조사, 분쟁해결, 민원처리, 법령상 의무이행을 위하여 필요한 범위 내에서만 보유·이용됩니다.--%>
<%--제5조(개인정보처리 위탁)--%>

<%--① 당행은 처리목적 달성을 위하여 개인정보의 처리를 위탁하고 있으며, 자세한 내용은 “홈페이지>고객센터>개인정보처리방침>개인(신용)정보처리 위탁 및 제공 현황”에서 확인할 수 있습니다.--%>
<%--상세내역보기--%>
<%--② 위탁계약 체결 시 개인정보보호 관련 법규의 준수, 개인정보에 관한 제3자 제공 금지 및 책임부담 등을 명확히 규정하고, 당해 계약내용을 서면 및 전자 보관하고 있습니다.--%>
<%--제6조(개인정보의 국외이전)--%>

<%--당행은 개인정보주체의 동의를 받은 경우에 한하여 개인정보를 국외로 이전하고 있습니다.--%>
<%--자세한 내용은 “홈페이지 > 고객센터 > 개인정보처리방침 > 개인(신용)정보처리 위탁 및 제공 현황”에서 확인할 수 있습니다.--%>
<%--상세내역보기--%>
<%--제7조(정보주체와 법정대리인의 권리·의무 및 그 행사방법)--%>

<%--① 고객은 당행이 처리하는 자신 및 14세 미만 아동(법정대리인만 해당)의 열람을 요구할 수 있습니다.--%>
<%--② 자신의 개인정보를 열람한 고객은 사실과 다르거나 확인할 수 없는 개인정보에 대하여 당행에 정정 또는 삭제를 요구할 수 있습니다. 다만, 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.--%>
<%--③ 고객은 당행에 대하여 자신의 개인정보 처리의 정지를 요구할 수 있습니다. 다만 다음 각 호의 어느 하나에 해당하는 경우에는 당행은 해당 사유를 고객에게 알리고, 처리정지 요구를 거절할 수 있습니다.--%>
<%--1. 법률에 특별한 규정이 있거나 법령상 의무를 준수하기 위하여 불가피한 경우--%>
<%--2. 다른 사람의 생명ㆍ신체를 해할 우려가 있거나 다른 사람의 재산과 그 밖의 이익을 부당하게 침해할 우려가 있는 경우--%>
<%--3. 개인정보를 처리하지 아니하면 고객과 약정한 서비스를 제공하지 못하는 등 계약의 이행이 곤란한 경우로서 고객이 그 계약의 해지 의사를 명확하게 밝히지 아니한 경우--%>
<%--④ 당행은 고객의 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인 지를 확인합니다.--%>
<%--제8조(처리하는 개인정보의 항목)--%>

<%--당행은 (금융)거래의 설정·유지·이행·관리 및 상품서비스의 제공을 위한 필수정보 및 선택정보를 다음 각 호와 같이 수집하고 있습니다.--%>
<%--1. 필수적 정보--%>

<%--개인식별정보 : 성명, 고유식별정보(주민등록번호, 여권번호, 외국인등록번호, 운전면허번호), 국내거소신고번호, CI, DI, UUID, 국적, 직업군, 주소(직장,자택), 직장명, 전화번호(자택, 직장, 휴대전화번호), 생채인증정보, 전자우편주소--%>
<%--(금융)거래정보 : 상품종류, 거래조건(이자율, 만기, 담보 등), 거래일시, 금액 등 거래 설정 및 내역 정보--%>
<%--신용평가를 위한 정보(여신거래에 한함)--%>
<%--신용능력정보 : 직업·재산·채무·소득의 총액 및 납세실적, 그 밖에 이와 유사한 정보--%>
<%--신용도판단정보 : 금융거래 등 상거래와 관련하여 발생한 채무의 불이행, 연체, 부도, 대위변제, 대지급과 그 밖의 부정한 방법에 의한 신용질서 문란행위와 관련된 금액 및 발생, 해소의 시기 등에 관한 사항--%>
<%--전자금융거래법에 따른 정보 : 사용자ID, 접속일시, IP주소 또는 전화번호 등 전자금융거래법에 따른 수집 정보--%>
<%--기타 금융거래의 설정·유지·이행·관리를 위한 상담, 채권관리 등을 통해 생성되는 정보--%>
<%--2. 선택적 정보--%>

<%--개인식별정보 외에 거래신청서에 기재된 정보 또는 고객이 제공한 정보--%>
<%--주거 및 가족사항, 거주기간, 세대구성, 결혼여부--%>
<%--제9조(인터넷 접속파일 등 개인정보 자동 수집 장치의 설치·운영 및 거부에 관한 사항)--%>

<%--당행은 손님 개개인에게 개인화되고 맞춤화된 서비스를 제공하기 위해 다음의 각호와 같은 인터넷 접속정보파일 등 자동 수집 장치를 설치·운영하고 있습니다.--%>
<%--1. 쿠키(cookie)--%>

<%--당행은 손님의 정보를 수시로 저장하고 찾아내는 "쿠키(cookie)" 등을 운용합니다. 쿠키란 당행의 웹사이트를 운영하는데 이용되는 서버가 손님의 브라우저에 보내는 아주 작은 텍스트 파일로서 손님의 컴퓨터 하드디스크에 저장됩니다. 당행은 다음과 같은 목적을 위해 쿠키를 사용합니다.--%>
<%--쿠키 등 수집항목, 보유기간 및 사용 목적--%>
<%--쿠키 등의 접속화면, 접속빈도, 접속시간을 수집하며 아래 목적을 위하여 금융거래 종료시까지 보유이용합니다.--%>
<%--회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 자취추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 맞춤 서비스 제공 및 사용성 개선--%>
<%--손님은 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 손님은 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.--%>
<%--쿠키 설정 거부 방법--%>
<%--쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.--%>
<%--※ 예시--%>
<%--- 웹브라우저(예시)--%>
<%--Chrome : 더보기 설정 → 개인정보 및 보안 → 쿠키 및 기타 사이트 데이터 → 옵션 선택 (쿠키 차단 또는 허용)--%>
<%--Microsoft Edge : 더보기 설정 → 쿠키 및 사이트 권한 → 쿠키 및 사이트 데이터 관리 및 삭제 → 옵션선택(쿠키 차단 또는 저장 및 읽기허용)--%>
<%--- 스마트폰(예시)--%>
<%--안드로이드폰 : ① 구글설정 → ② 광고 → ③ 광고 맞춤설정 선택 또는 해제--%>
<%--아이폰 : ① 아이폰설정 → ② 개인정보보호 → ③ 광고 → ④ 광고 추적 제한--%>
<%--단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.--%>
<%--2. 페이스북 픽셀--%>

<%--당행은 이용자의 광고 효과를 분석하기 위해, 페이스북의 1x1 픽셀의 코드를 개인뱅킹 채널, 스마트폰 앱, 모바일웹뱅킹 내에 설치합니다.--%>
<%--수집 정보: 각 사용자의 이벤트 시간(Event Time), 이벤트 카테고리(Event Category), 기기(Device), 추천 URL(Referring URL)--%>
<%--거부방법 : 페이스북 계정 로그인 - 설정 ? 광고 ? 광고설정에서 ‘허용되지 않음’ 설정, 웹브라우저, 스마트폰 등의 쿠키 차단 설정--%>
<%--3. 전자금융거래법에 따른 수집정보--%>

<%--당행은 전자금융거래법의 이행을 위해 자동수집장치를 운영합니다.--%>
<%--수집정보: 고객 아이디, 접속일시, IP주소 또는 전화번호, 전자적 장치와 접근매체 관련 정보(HDD Serial, MAC Address, 개인방화벽 설정, 운영체제 종류 브라우저 버전 등), 전자금융거래 내용 등--%>
<%--별도의 거절절차는 없음--%>
<%--4. 전화상담 업무 과정에서 자동 수집되는 정보--%>

<%--당행은 전화상담업무 처리과정에서 다음의 정보를 자동수집합니다.--%>
<%--손님케어섹션의 대고객 업무 과정에서 생성되는 정보--%>
<%--손님행복섹션의 민원업무 과정에서 생성되는 정보--%>
<%--영업점에서 자산관리 또는 대출자동연장 업무 과정에서 생성되는 정보--%>
<%--별도의 거절절차는 없으며 전화상담 거부시 자동 수집되지 않음--%>
<%--※ 당행은 원칙적으로 고객의 사생활을 침해할 우려가 있는 민감정보는 수집하지 않습니다.--%>
<%--필요한 경우 별도의 동의를 받아 수집하고 동의한 목적을 위해서만 제한적으로 이용합니다.--%>
<%--5. 모바일 서비스 시 자동 수집되는 정보--%>

<%--당행은 마이데이터 서비스(본인신용정보관리업) 처리과정에서 다음의 정보를 자동수집합니다.--%>
<%--수집정보: UUID--%>
<%--6. 수집방법--%>

<%--당행 영업점에 내방한 고객으로부터 직접 수집--%>
<%--홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 응모내역, 배송요청--%>
<%--생성정보 수집 툴을 통한 수집--%>
<%--고객센터의 문의사항을 통한 수집--%>
<%--제10조(행태정보 수집·이용)--%>

<%--당행은 상품·서비스 개발 및 고객분석 등 이 사이트의 이용 분석에 활용하기 위해 온라인 행태정보를 수집·이용 하고 있습니다.--%>
<%--행태정보란 웹 사이트 방문 이력, 앱 사용 이력, 구매 및 검색 이력 등 이용자의 관심, 흥미, 기호 및 성향 등을 파악하고 분석할 수 있는 온라인상의 이용자 활동정보를 말합니다.--%>
<%--1. 수집하는 행태정보의 항목--%>
<%--- 웹/앱 서비스 방문기록, 검색·클릭 등 사용기록, 광고식별자--%>
<%--2. 행태정보 수집 방법--%>
<%--- 이용자가 웹/앱 내에서 행해지는 주요행동에 대해 생성 정보 수집 툴을 통해 자동 수집 전송--%>
<%--3. 행태정보 수집 목적--%>
<%--- 상품·서비스 개발 및 통계, 고객분석 등 이용자 분석에 활용하기 위한 목적--%>
<%--4. 행태정보 보유·이용 기간 및 이후 정보처리 방법--%>
<%--- 수집일로부터 최대 3년간 보유·이용되며, 이용기간 종료 시 행태정보는 지체없이 삭제--%>
<%--5. 이용자 통제권 행사 방법--%>
<%--- 고객이 브라우저 설정을 조정하여 쿠키 저장 거부 등을 통해 이용을 거부할 수 있습니다.--%>
<%--* 예시--%>
<%--웹브라우저--%>
<%--Internet Explore: 도구 → 인터넷옵션 → 개인정보 → 고급 → 쿠키 차단 또는 처리안함--%>
<%--Chrome: 설정→ 고급 → 개인정보 및 보안 → 사이트 설정 → 쿠키 및 사이트 데이터 → 타사 쿠키 차단--%>
<%--스마트폰--%>
<%--안드로이드폰 : 설정 → 개인정보 보호 → 광고 → 광고 개인 최적화 선택 또는 해제--%>
<%--아이폰 : 설정 → 개인 정보 보호→ 광고 → 광고 추적 제한--%>
<%--(※ OS버전에 따라 방법이 다소 상이할 수 있습니다)--%>
<%--6. 이용자 피해구제 방법 관련부서 및 고객문의--%>
<%--- 하나은행 디지털채널부(☎ 1599 - 1111)--%>
<%--제11조(개인정보의 파기)--%>

<%--① 당행은 개인정보의 보유기간이 경과된 경우에는 다음 각 호의 사유가 없는 한 보유기간의 종료일로부터 5영업일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 다음 각 호의 사유가 없는 한 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5영업일 이내에 그 개인정보를 파기합니다.--%>
<%--1. 신용정보집중기관 또는 신용조회회사가 신용정보의 집중관리·활용 또는 개인의 신용도 등을 평가하기 위한 목적으로 개인신용정보를 보유하는 경우(보유기간에 한함)--%>
<%--2. 신용정보회사 등이 민·형사상의 책임 또는 시효가 지속되거나 분쟁의 입증자료로서 개인신용정보를 보유하는 경우--%>
<%--3. 법령에 따라 보존하여야 하는 경우--%>
<%--보존근거	보존하는 개인정보항목	보존기간--%>
<%--상법 제33조	계약서, 거래신청서 등 영업에 관한 중요서류(전산자료포함)	금융거래 종료 후 10년--%>
<%--신용정보의 이용 및 보호에 관한 법률 제20조의2	금융거래 관계 설정 및 거래내역 등 금융거래정보	금융거래 종료 후 5년--%>
<%--소득세법 시행령 제201조의10	연도별 납입액, 인출액, 납입전환 금액, 과세제외금액 등 연금납입확인서 발급을 위한 정보	영구--%>
<%--특정금융거래의 보고 및 이용에 관한 법률 제5조의4	실지명의 확인 및 보고대상 금융거래자료 송금인 및 수취인에 관한 정보 등	금융거래 종료 후 5년--%>
<%--※ 신용정보의 이용 및 보호에 관한 법률 제20조의 2 제2항에 따라 모든 금융거래가 종료된 날로부터 5년 경과 시분리보관되며 법령에 따른 보존기관 경과시 삭제됩니다.--%>
<%--기타 이와 유사한 정당한 사유가 있는 경우--%>
<%--② 마이데이터 서비스(본인신용정보관리업) 의 전송요구권을 통해 수집된 개인신용정보의 보유기간이 경과된 경우에는 1항에 불구하고 해당 사유 발생 즉시 그 개인신용정보를 파기합니다.--%>
<%--③ 개인정보가 기록된 출력물, 서면 등은 파쇄 또는 소각의 방법으로 파기하고, 전자적 파일형태의 개인정보는 복원이 불가능한 방법으로 영구 삭제하는 방법으로 파기합니다.--%>
<%--제12조(개인정보의 안전성 확보 조치)--%>

<%--당행은 개인정보보호법 제29조에 따라 다음 각 호와 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.--%>
<%--개인정보의 암호화--%>

<%--고객의 개인정보 중 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.--%>
<%--해킹 등에 대비한 기술적 대책--%>

<%--당행은 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.--%>
<%--개인정보 취급 직원의 최소화 및 교육--%>

<%--개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.--%>
<%--제13조(가명정보의 처리)--%>

<%--① 가명처리하는 개인정보의 항목--%>
<%--- 홈페이지>고객센터>개인정보처리방침> 가명정보 처리 현황에서 확인할 수 있습니다.--%>
<%--② 가명정보의 처리 목적--%>
<%--- 통계작성(상업적 목적 포함), 과학적연구(산업적 연구 포함), 공익적 기록보존 목적 등을 위하여 개인정보를 가명처리 할 수 있으며, 홈페이지>고객센터>개인정보처리방침>가명정보 처리 현황에서 확인할 수 있습니다.--%>
<%--③ 가명정보의 보유 및 기간--%>
<%--- ‘가명처리한 개인정보’(이하 가명정보)는 가명처리 계획 수립시 정한 목적을 달성하는 기간(시점)까지만 보유 및 이용되며, 홈페이지>고객센터>개인정보처리방침>가명정보 처리 현황에서 확인할 수 있습니다.--%>
<%--④ 가명정보의 제3자 제공에 관한 사항--%>
<%--- 제공받는 자, 제공받는 자의 이용목적, 제공하는 가명정보의 종류는 홈페이지>고객센터>개인정보처리방침> 가명정보 처리 현황에서 확인할 수 있습니다.--%>
<%--가명정보처리현황 상세내역보기--%>
<%--⑤ 가명정보의 안전성 확보조치에 관한 사항--%>
<%--- 당행은 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.--%>
<%--1. 관리적 조치 : 내부관리계획 수립?시행, 정기적 직원 교육 등--%>
<%--2. 기술적 조치 : 가명정보에 대한 접근권한 관리, 접근통제, 재식별방지, 보안프로그램 설치--%>
<%--3. 물리적 조치 : 전산실, 자료보관실 등의 접근통제--%>
<%--제14조(추가적인 이용·제공 판단기준)--%>

<%--① 당행은 ?개인정보 보호법? 제15조제3항 및 제17조제4항에 따라 ?개인정보 보호법 시행령? 제14조의2에 따른 사항을 고려하여 정보주체의 동의 없이 개인정보를 추가적으로 이용·제공할 수 있습니다.--%>
<%--② 당행이 정보주체의 동의 없이 추가적인 이용·제공을 하기 위해서 다음과 같은 사항을 고려하였습니다.--%>
<%--1. 개인정보를 추가적으로 이용·제공하려는 목적이 당초 수집 목적과 관련성이 있는지 여부--%>
<%--2. 개인정보를 수집한 정황 또는 처리 관행에 비추어 볼 때 추가적인 이용·제공에 대한 예측 가능성이 있는지 여부--%>
<%--3. 개인정보의 추가적인 이용·제공이 정보주체의 이익을 부당하게 침해하는지 여부--%>
<%--4. 가명처리 또는 암호화 등 안전성 확보에 필요한 조치를 하였는지 여부--%>
<%--제15조(개인정보 처리방침의 변경)--%>

<%--당행이 개인정보 처리방침을 변경하는 경우에는 변경 및 시행의 시기, 변경된 내용을 지속적으로 공개하며, 변경된 내용은 고객이 쉽게 확인할 수 있도록 변경 전·후를 비교하여 공개합니다.--%>
<%--제16조 (권익침해 구제방법)--%>

<%--고객은 개인정보침해로 인한 신고나 상담이 필요하신 경우 아래 기관에 문의하시기 바랍니다.--%>
<%--개인정보분쟁조정위원회--%>
<%--(www.kopico.go.kr / 1833-6972)--%>
<%--한국인터넷진흥원 개인정보침해신고센터--%>
<%--(privacy.kisa.or.kr / 국번 없이 118)--%>
<%--개인정보보호협회 개인정보보호인증--%>
<%--(www.eprivacy.or.kr / 02-550-9531~2)--%>
<%--대검찰청 첨단범죄수사과--%>
<%--(www.spo.go.kr /(대검찰청 대표번호) 1301)--%>
<%--경찰청 사이버범죄신고시스템--%>
<%--(www.police.go.kr/www/security/cyber.jsp /(국번없이) 182)--%>
<%--제17조(개인정보 보호책임자 및 고충사항 처리부서)--%>

<%--개인정보 보호법 제31조 제1항에 따른 당행의 개인정보 보호책임자는 다음과 같습니다.--%>
<%--개인정보보호 책임자 :--%>
<%--정보보호본부장 상무 이주환--%>
<%--담당부서 :--%>
<%--정보보호부 02-3788-5143--%>
<%--민원처리부서 : 고객센터--%>
<%--1588-1111 / 080-933-1111--%>
<%--                            </pre>--%>
                            <pre>
Please read this Privacy Policy carefully to ensure that you understand how the terms of this Privacy Policy are applied. The following Privacy Policy explains how we collect, use, transfer, disclose and protect your personally identifiable information obtained through LINE Bank by Hana Bank (as defined below).

This Privacy Policy is included as part of the Terms of Use. This Privacy Policy covers the following:

1. Definitions
2. Information we collect
3. Information you provide directly
4. Use of information we collect
5. Provision of information we collect
6. Security
7. Changes to this Privacy Policy
8. Other
9. Acknowledgment and approval
10. Privacy Policy for using LINE ID for LINE Bank by Hana Bank
11. Stop receiving e-mail
12. Contact us
13. Your use of our applications and services is subject to these Terms of Use and Privacy Policy and indicates your agreement to such Terms of Use and Privacy Policy.

Definition

Bank is PT Bank KEB Hana Indonesia, a company established under the laws of the Republic of Indonesia.
LINE Bank by Hana Bank is a digital banking application that has been licensed by the OJK and BI and registered as Electronic System in Ministry of Information Technology`s. A piece of software application where all the instructions you carry out will come from the mobile application or online.
LINE Bank by Hana Bank can be operated via Android phones (OS 7.0 and above) and iPhone (iOS 11.0 and above) via Google Play Store or Apple Store.
Personal Information is information about you that is personally identifiable that is collected through the Application, such as your name, address, date of birth, telephone number, e-mail address and /or similar.
Website is our website at www.linebank.co.id.
Information We Collect

LINE Bank by Hana Bank respects matters relating to your data protection and privacy.
Therefore, the Bank will only use your name and other data including LINE messenger user ID related to you in accordance with this privacy policy.
The Bank only collects data that is important to the Bank and the Bank will only collect Data that is needed for everything related to you. The Bank will only retain your Data as long as it is necessary to fulfill legal obligations or as long as the Data is related to the purposes for which the Data was collected. The Bank`s privacy policy follows applicable statutory policies to maintain data confidentiality except that the Bank is required by applicable law to disclose data to authorized third parties such as the government or other government agencies, only if there is a lawful order.
The Bank collects certain Personal Information from you so that LINE Bank by Hana Bank can find the required Services from Service Providers. You will provide Personal Information directly (for example, when you register) and some information will be automatically collected when you use LINE Bank by Hana Bank.
When you visit our Website or application, the website/application administrator we will process technical data such as your IP address, the web pages you have visited, the internet browser you use, the web pages you previously/subsequently visited and the duration of each visit/session that allows the Bank to deliver Website/application functions. With this technical data, Bank Website administrators can manage the Website, for example by resolving technical difficulties or improving the accessibility of certain parts of the Website/Application. In this way, the Bank can ensure that you can (continue to) find information on the Website in a fast and simple way.
You will be asked to carry out authorization instructions using various different types of security information (e.g. Security Code, user name, password) if necessary.
After authorizing, LINE Bank by Hana Bank will carry out instructions according to your orders, you are required to ensure that you do not disclose your security information to other parties.
LINE Bank by Hana Bank ensures that the confidentiality and security of the personal information you provide is well maintained. We will use your data in accordance with applicable provisions.
You can ask or provide input to us via Call Hana (1500021).
Information that You Provide Directly

When registering with LINE Bank by Hana Bank, you will provide the Bank with your electronic mail address (email), name, telephone number, account password and LINE Messenger User ID.
When you use LINE Bank by Hana Bank, the Bank will also process your technical data such as IP address, Device Identity (ID) or MAC address, and information about the manufacturer, model and operating system of your mobile device. The Bank uses this data to enable the Bank to deliver the functions of LINE Bank by Hana Bank, resolve technical difficulties, provide you with the correct and most current version of the Application and to improve the Applications functionality.
Use of Information We Collect

The bank uses your email, name, telephone number, LINE Messenger ID and account password to verify your ownership of an account to provide you information regarding the Application. The Bank can also use your name, email and telephone number to send messages and general updates to the Application. The bank will also send you an email asking you to subscribe to our Mailing List. You can at any time choose not to receive information regarding these updates.

Banks use information such as the name of the bank where your account was created, the name where the account is kept and the amount transfered for the payment you made. You hereby agree that your data will be used by the Bank`s internal data processing to provide better services to you.

The data we obtain directly from you through filling in LINE Bank by Hana Bank. Data collected when you use LINE Bank by Hana Bank that the Bank may use to identify you and authenticate LINE Bank by Hana Bank users for loss and fraud prevention purposes.

Moreover, the Bank will use Data that you provide for the administration of your account with the Bank for the purposes of verifying and managing transactions related to LINE Bank by Hana Bank, conducting research on demographic data of LINE Bank by Hana Bank users, developing LINE Bank by Hana Bank, sending you information that the Bank consider useful to you including information about services from the Bank after you have given consent to the Bank that you do not object to being contacted regarding the Banks services.

The Bank may use your personal information, including date of birth to verify identity, help users, determine which Services are right for you and useful to you and to understand the most interesting parts of LINE Bank by Hana Bank.

Aggregated data will be considered non-personal information for the purposes of this privacy policy. If you register as a LINE Bank by Hana Bank user, the Bank will also use your personal information to send you marketing services from time to time.

Transactions you make via LINE Bank by Hana Bank are processed by PT Bank KEB Hana Indonesia. You must provide accurate and not misleading data to the Bank. You must update and notify the Bank if there are changes to the data related to you. The bank will store your transaction details for bank security reasons. You can access this information by logging into your account via the LINE Bank by Hana Bank application.

You can see details of transactions you have made, fund information and subscriptions from marketing services provided by LINE Bank by Hana Bank does. You will not allow third parties to access your personal data. The Bank is not responsible for misuse of passwords and/or PINs. You are obliged to notify the Bank if you believe that your password and/or PIN is being misused by another party.

Providing Information We Collect

The Bank may employ third party companies and individuals to facilitate or provide the Application and certain services on behalf of the Bank, to provide consumer assistance, provide information, to carry out services related to the Website/application ( for example without limitation, maintenance services, database management, web analysis and improvements to Website/application features) or to assist the Bank in analyzing how the Bank Services are used or for the Banks professional advisors and external auditors, including legal advisors, financial advisors and consultants-consultant. These third parties only have access to your personal information to carry out these tasks on behalf of the Bank and are contractually bound not to disclose or use such personal information for any other purpose.

The Bank does not share Information Your personal information to any party other than the relevant Service Providers and third party companies and individuals mentioned in the section above, without your consent. However, the Bank will disclose your Personal Information as long as it is legally required, or necessary to comply with statutory, regulatory and government provisions, or in the event of a dispute, or any form of legal process between you and the Bank, or between you and other users in connection with, or related to the Services, or in emergencies relating to your health and/or safety.

Your Personal Information can be transferred, stored, used and processed in a jurisdiction other than Indonesia where the Bank`s servers are located. You understand and agree to the transfer of your Personal Information outside Indonesia.

The Bank does not sell or rent your Personal Information to third parties. The bank will hold your information until you delete your account on the Application.

Security

The Bank ensures that the information and/or Data collected will be stored safely. The Bank stores your information and/or personal data as long as necessary to fulfill the purposes described in this privacy policy.

The Bank does not guarantee that the data you provide will not be detained/interrupted while being sent to the Bank. Any transmission of information by you to the Bank is at your own risk. You may not disclose your password to anyone. No matter how effective a technology is, no security system is impenetrable.

Changes to This Privacy Policy

LINE Bank by Hana Bank has the right to change the Bank`s privacy policy in accordance with the Terms & Conditions from time to time.

If the Bank changes this Privacy Policy, the Bank will notify you via email or by means of a notification on the Website 30 business days before the change takes effect. The Bank urges you to review this page periodically to find out the latest information about how the Bank applies the provisions of this Privacy Policy.

Other

This Privacy Policy is made based on the laws of applies in Indonesia and must be regulated and interpreted according to Indonesian law. This Privacy Policy is prepared in Indonesian. All subsequent correspondence relating to this Privacy Policy shall be conducted in Indonesian.

Governing law and jurisdiction. This Privacy Policy is governed by and to be interpreted in the laws of the Republic of Indonesia. Any and all disputes arising from this privacy policy will be governed by the exclusive jurisdiction of the South Jakarta District Court.

Acknowledgement and Agreement

By using the Application, you acknowledge that you have read and understand this Privacy Policy and the Terms of Use and agree and consent to the use, practices, processing and transfer of your personal information by the Bank as stated in this Privacy Policy.

You also declare that you have the right to share all the information you have provided to the Bank and to give the Bank the right to use and share that information with Service Providers.

Privacy Policy ID LINE for LINE Bank by Hana Bank

To support digital banking provided by PT Bank KEB Hana Bank Indonesia, namely "LINE Bank by Hana Bank" via online or offline (hereinafter referred to as " Services"), LY Corporation ("LYC", "we" or "us" ") has adopted this LINE ID Privacy Policy for LINE Bank by Hana Bank to explain our handling of additional information obtained, used or shared by the Company with LYC (or LY Corporation).

Privacy Policy LINE ID for LINE Bank by Hana Bank is the additional the provisions of LINE’s Privacy Policies, which remain in effect and apply equally to the additional items of information described in this Privacy Policy.

Privacy Policy for use of LINE Bank location information by Hana Bank

You agree to provide location information to LINE Bank by Hana Bank for receive personalized services, experiences and benefits while you use LINE Bank services. All forms of location information will be processed and handled in accordance with the LINE Bank by Hana Bank Privacy Policy.

Information Shared by LINE with Hana Bank

You agree that In order to provide Service facilities, and support customers in connection with our Services to prevent unauthorized use of our Services, LY Corporation may provide personal information that has been collected by LY Corporation to Hana Bank to the extent of providing the Services described in the LINE Bank Privacy Policy by Hana Bank.

When you submit request to correct and/or updates your personal information in LINE’s Corporation system, LY Corporation collects such personal information for the purpose of updating our records.

Upon such matters, LY Corporation will also automatically share such personal information with Hana Bank for the purpose of updating Hana Bank’s records system, for the purpose to provide the Service and to ensure a seamless user experience.

Personal information shared by Hana Bank to LYC (or LY Corporation) will be processed and handled in accordance with the LINE Bank by Hana Bank Privacy Policy.

Information Shared by Hana Bank with LINE

Please refer to the LINE Bank by Hana Bank Privacy Policy for details of information shared by Hana Bank with LYC (or LY Corporation) for all data shared with and/or to other parties based on the Customers individual consent.

Changes to LINE Bank by Hana Bank Addendum

LINE ID Privacy Policy for LINE Bank by Hana Bank may be changed from time to time to reflect changes to the Services and related laws and regulations. LINE ID Privacy Policy for LINE Bank by Hana Bank was last updated on September 30, 2023. Privacy Policy for use of LINE Bank location information by Hana Bank was last updated on December 06, 2022.

We will notify you when we make any material changes to the LINE ID Privacy Policy for LINE Bank by Hana Bank via the LINE App or by other reasonable means. LINE Privacy Policy and LINE ID Privacy Policy for LINE Bank by Hana Bank can be accessed directly in the LINE app and on our website.

Stop Receiving E-mails

The bank has a policy for opting in/out of the database. If you wish to stop receiving emails from the Bank, please click the unsubscribe link included in each e-mail.

Contact Us

If you have further questions about the privacy and security of your information and wish to update or delete your data then please contact us at: help@linebank.co.id or call: 1500021.
                            </pre>
                        </h6>
                    </div>
                </div>
            </div>

            <div class="agree-check clearfix mt7 mb15">
	<span class="fleft"> <input type="checkbox" id="p6" value="">
		<label for="p6"><em>I have read and agree to the terms and conditions</em></label>
	</span>
            </div>

            <form name="frm" id="frm" method="post" action="/signUp_STEP2">
                <input type="hidden" name="dummy">
                <input type="hidden" id="agreeYN" name="agreeYN" value="">
                <div class="btn-area mt15 mb30">
                    <span class=" btn-pack btn-type-3c ui-btn-pack-button ui-set-btn-pack ui-set-btn-pack-event">
                        <button
                                type="submit" class="" id="buttonConfirm"
                                onclick="return chkAgree();">Next
                        </button>
                    </span>
                    <span class=" btn-pack btn-type-3 ui-btn-pack-a ui-set-btn-pack ui-set-btn-pack-event">
                        <a href="/signUp" id="buttonCancel" class="">Prev</a></span>
                </div>
                <input type="hidden" name="transkey_i" id="transkey_i" value="0">
                <input type="hidden"
                       name="transkey_inputs"
                       id="transkey_inputs"
                       value="">
                <input type="hidden" name="transkeyUuid" id="transkeyUuid" value="undefined">
            </form>

        </div>
    </main>

</div>

<%--<script>--%>
<%--    const progress = document.querySelector('#progress');--%>
<%--    const stepButtons = document.querySelectorAll('.step-button');--%>

<%--    Array.from(stepButtons).forEach((button, index) => {--%>
<%--        button.addEventListener('click', () => {--%>
<%--            progress.setAttribute('value', index * 100 / (stepButtons.length - 1)); // 5단계로 확장--%>

<%--            stepButtons.forEach((item, secindex) => {--%>
<%--                if (index >= secindex) {--%>
<%--                    item.classList.add('done');--%>
<%--                }--%>
<%--                if (index < secindex) {--%>
<%--                    item.classList.remove('done');--%>
<%--                }--%>
<%--            })--%>
<%--        })--%>
<%--    })--%>

<%--</script>--%>

<script>
    <%--    약관 체크--%>

    function chkAgree() {
        let agreeBox = document.getElementById('p6');
        let agreeInput = document.getElementById('agreeYN');

        if (agreeBox.checked) {
            agreeInput.value = "Y";
            return true;
        } else {
            let confirmResult = confirm('약관 내용을 확인하고 모두 동의하십니까?');
            if (confirmResult) {
                agreeInput.value = "Y";
                return true;
            } else {
                return false; // Form submission is cancelled.
            }
        }
    }
</script>

</body>
</html>
