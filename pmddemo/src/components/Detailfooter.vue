<template>
    <div>
        <van-goods-action class="van-goods-action">
            <!-- <van-goods-action-icon icon="chat-o" text="客服" color="#07c160" />
            <van-goods-action-icon icon="cart-o" text="购物车" />
            <van-goods-action-icon icon="star" text="已收藏" color="#ff5000" /> -->
            <van-goods-action-button type="warning" text="加入购物车" />
            <van-goods-action-button type="danger" text="立即购买" />
        </van-goods-action>
    </div>
</template>

<style scoped>
/* .van-goods-action{
    border-radius: 30px;
} */
.van-goods-action{
    background-color: rgba(0, 0, 0, 0);
    margin-bottom: -0.33rem;
}
</style>