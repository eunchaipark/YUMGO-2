<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setBundle basename="messages_index" />
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>메인 – YUMGO</title>

        <!-- Pretendard 웹폰트 -->
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"
        />
        <link
            rel="manifest"
            href="${pageContext.request.contextPath}/manifest.json"
        />
        <meta name="theme-color" content="#0D6564" />
        <style>
            /* ✅ 공통 초기화 */
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            body {
                font-family: "Pretendard", sans-serif;
                background: #f2f5fb;
                display: flex;
                justify-content: center;
            }

            /* ✅ 전체 컨테이너 */
            .main {
                width: 100%;
                max-width: 360px;
            }

            /* ✅ 헤더 */
            .header {
                background: #e0f7f4;
                border: 1px solid #e9f7f4;
                border-radius: 8px 8px 0 0;
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 0.75rem;
            }

            .header img.logo {
                width: 40px;
                height: 40px;
            }

            .header img.logotype {
                flex: 1;
                height: 24px;
                object-fit: contain;
                margin: 0 0.5rem;
            }

            .header img.user {
                width: 24px;
                height: 24px;
                cursor: pointer;
            }

            /* ✅ 왼쪽 손잡이 (윗칸용) */
            .handle-fixed {
                position: absolute;
                left: 5px;
                top: 140px;
                width: 15px;
                height: 100px;
                background: #0d6564;
                border: 2px solid #000;
                box-shadow: inset 0px 4px 4px rgba(0, 0, 0, 0.25),
                    inset 0px -4px 4px rgba(0, 0, 0, 0.25);
                border-radius: 10px;
                z-index: 50;
            }

            /* ✅ 아랫칸 가로 손잡이 */
            .handle-bottom {
                width: 60px;
                height: 15px;
                background: #0d6564;
                border: 2px solid #000;
                box-shadow: inset 0px 4px 4px rgba(0, 0, 0, 0.25),
                    inset 0px -4px 4px rgba(0, 0, 0, 0.25);
                border-radius: 10px;
                position: absolute;
                top: 20px;
                left: 50%;
                transform: translate(-50%, -50%);
                z-index: 10;
            }

            /* ✅ 카드 (윗칸 & 아랫칸 공통) */
            .card {
                background: #ffffff;
                border-radius: 10px;
                padding: 10px;
                margin-top: 0.25rem;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
                position: relative;
            }

            /* ✅ 섹션 컨테이너 */
            .section-container {
                padding: 10px;
                position: relative;
            }

            /* ✅ 윗칸/아랫칸 타이틀 */
            .section-header {
                display: flex;
                align-items: center;
                color: #333333;
                gap: 6px;
            }

            .section-header h2 {
                font-weight: 700;
                font-size: 20px;
                color: #333333;
            }

            /* ✅ 윗칸 오른쪽 상단 문구 */
            .upper .sub {
                position: absolute;
                top: 20px;
                right: 12px;
                font-weight: 400;
                font-size: 0.875rem;
                color: #333;
                text-shadow: 0px 4px 4px #5ecb8a;
            }

            /* ✅ 첫 줄 (냉장고 열기/음식 넣기) */
            .tile-row.big {
                display: flex;
                justify-content: center;
                gap: 25px;
                margin-top: 12px;
            }

            /* ✅ 두 번째 줄 (작은 타일 3개 중앙정렬) */
            .tile-row.small {
                display: flex;
                justify-content: center;
                gap: 10px;
                margin-top: 12px;
            }

            /* ✅ 타일 공통 스타일 */
            .tile {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                background: rgba(102, 205, 170, 0.1);
                border: 1px solid #168b85;
                border-radius: 10px;
                text-align: center;
                font-weight: 700;
                font-size: 12px;
                color: #0d6564;
            }

            /* ✅ 큰 타일 */
            .big-tile {
                width: 140px;
                height: 120px;
            }

            .big-tile img {
                width: 50px;
                height: 50px;
                margin-bottom: 6px;
            }

            /* ✅ 작은 타일 */
            .small-tile {
                width: 100px;
                height: 100px;
            }

            .small-tile img {
                width: 40px;
                height: 40px;
                margin-bottom: 4px;
            }

            /* ✅ 아랫칸 통계 박스 */
            .stats-row {
                display: flex;
                gap: 10px;
                margin-top: 12px;
            }

            .stats-row .stat {
                flex: 1;
                background: rgba(118, 215, 196, 0.2);
                border: 2px solid #76d7c4;
                border-radius: 10px;
                padding: 0.75rem;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
            }

            .stats-row .stat h3 {
                font-weight: 700;
                font-size: 1rem;
                color: #0d6564;
                margin-bottom: 0.5rem;
            }

            .stats-row .stat p {
                font-weight: 500;
                font-size: 0.75rem;
                color: #0d6564;
                line-height: 1.2;
            }
        </style>
    </head>

    <body>
        <div class="main">
            <!-- ✅ 헤더 -->
            <div class="header">
                <img
                    class="logo"
                    src="${pageContext.request.contextPath}/resources/img/logo.png"
                    alt="냉장고 아이콘"
                />
                <img
                    class="logotype"
                    src="${pageContext.request.contextPath}/resources/img/Yumgo.png"
                    alt="Yumgo 로고"
                />
                <a href="${pageContext.request.contextPath}/member/mypage.do">
                    <img
                        class="user"
                        src="${pageContext.request.contextPath}/resources/img/user.png"
                        alt="사용자 아이콘"
                    />
                </a>
            </div>

            <!-- ✅ 냉장고 윗칸 -->
            <div class="section-container">
                <div class="handle-fixed"></div>
                <div class="card upper">
                    <div class="section-header">
                        <img
                            src="${pageContext.request.contextPath}/resources/img/fridge-1.png"
                            class="section-icon"
                        />
                        <h2><fmt:message key="index.title.fridge.upper" /></h2>
                    </div>
                    <span class="sub"
                        ><fmt:message key="index.subtext.fridge"
                    /></span>

                    <!-- 첫 번째 줄 -->
                    <div class="tile-row big">
                        <form
                            action="${pageContext.request.contextPath}/fridge/list.do"
                            method="get"
                            style="margin: 0"
                        >
                            <div
                                class="tile big-tile"
                                onclick="this.closest('form').submit()"
                                style="cursor: pointer"
                            >
                                <img
                                    src="${pageContext.request.contextPath}/resources/img/fridge-open.png"
                                    alt="냉장고 열기"
                                />
                                <span
                                    ><fmt:message key="index.button.open"
                                /></span>
                            </div>
                        </form>

                        <form
                            action="${pageContext.request.contextPath}/fridge/add.do"
                            method="get"
                            style="margin: 0"
                        >
                            <div
                                class="tile big-tile"
                                onclick="this.closest('form').submit()"
                                style="cursor: pointer"
                            >
                                <img
                                    src="${pageContext.request.contextPath}/resources/img/food-add.png"
                                    alt="음식 넣기"
                                />
                                <span
                                    ><fmt:message key="index.button.add"
                                /></span>
                            </div>
                        </form>
                    </div>

                    <!-- 두 번째 줄 -->
                    <div class="tile-row small">
                        <form
                            action="${pageContext.request.contextPath}/ingredient/search.do"
                            method="get"
                            style="margin: 0"
                        >
                            <div
                                class="tile small-tile"
                                onclick="this.closest('form').submit()"
                                style="cursor: pointer"
                            >
                                <img
                                    src="${pageContext.request.contextPath}/resources/img/search-food.png"
                                    alt="음식 정보 검색"
                                />
                                <span
                                    ><fmt:message key="index.button.search"
                                /></span>
                            </div>
                        </form>

                        <form
                            action="${pageContext.request.contextPath}/recipe/search_recommend.do"
                            method="get"
                            style="margin: 0"
                        >
                            <div
                                class="tile small-tile"
                                onclick="this.closest('form').submit()"
                                style="cursor: pointer"
                            >
                                <img
                                    src="${pageContext.request.contextPath}/resources/img/recipe.png"
                                    alt="레시피 추천"
                                />
                                <span
                                    ><fmt:message key="index.button.recommend"
                                /></span>
                            </div>
                        </form>

                        <form
                            action="${pageContext.request.contextPath}/fridge/manage.do"
                            method="get"
                            style="margin: 0"
                        >
                            <div
                                class="tile small-tile"
                                onclick="this.closest('form').submit()"
                                style="cursor: pointer"
                            >
                                <img
                                    src="${pageContext.request.contextPath}/resources/img/remove-expired.png"
                                    alt="유통기한 지난 음식 제거"
                                />
                                <span>
                                    <fmt:message
                                        key="index.button.remove.expired"
                                    />
                                </span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- ✅ 냉장고 아랫칸 -->
            <div class="section-container">
                <div class="handle-bottom"></div>
                <div class="card lower">
                    <div class="section-header">
                        <img
                            src="${pageContext.request.contextPath}/resources/img/fridge-2.png"
                            alt="냉장고 아랫칸"
                            style="width: 30px; height: 30px"
                        />
                        <h2 style="font-size: 20px">
                            <fmt:message key="index.title.fridge.lower" />
                        </h2>
                    </div>
                    <div class="stats-row">
                        <div class="stat">
                            <h3><fmt:message key="index.summary.mine" /></h3>
                            <p>
                                <strong>
                                    <fmt:message
                                        key="index.summary.expiring.count"
                                    >
                                        <fmt:param value="${expiringCount}" />
                                    </fmt:message> </strong
                                ><br />
                                <strong>
                                    <fmt:message
                                        key="index.summary.total.count"
                                    >
                                        <fmt:param value="${totalCount}" />
                                    </fmt:message>
                                </strong>
                            </p>
                        </div>

                        <div class="stat">
                            <h3><fmt:message key="index.summary.fridge" /></h3>
                            <p>
                                <strong>
                                    <fmt:message
                                        key="index.summary.fridge.total.count"
                                    >
                                        <fmt:param value="${StoredTotal}" />
                                    </fmt:message> </strong
                                ><br />
                                <strong>
                                    <fmt:message
                                        key="index.summary.fridge.today.count"
                                    >
                                        <fmt:param
                                            value="${todayStoredCount}"
                                        />
                                    </fmt:message>
                                </strong>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<script>
    if ("serviceWorker" in navigator) {
        navigator.serviceWorker
            .register("${pageContext.request.contextPath}/service-worker.js")
            .then((reg) => console.log("✅ Service Worker 등록 성공:", reg))
            .catch((err) => console.log("❌ Service Worker 등록 실패:", err));
    }
</script>
