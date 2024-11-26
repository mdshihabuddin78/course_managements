<template>
    <user-profile-component>
        <div class="row mt-4">
            <!-- Project Status 1 -->
            <div class="col-md-6">
                <div class="card p-3">
                    <h6><em>assignment</em> Project Status</h6>
                    <p>Web Design</p>
                    <div class="progress">
                        <div class="progress-bar" role="progressbar" style="width: 80%;"></div>
                    </div>
                    <p>Website Markup</p>
                    <div class="progress">
                        <div class="progress-bar" role="progressbar" style="width: 72%;"></div>
                    </div>
                    <p>One Page</p>
                    <div class="progress">
                        <div class="progress-bar" role="progressbar" style="width: 89%;"></div>
                    </div>
                </div>
            </div>

            <!-- Project Status 2 -->
            <div class="col-md-6">
                <div class="card p-3">
                    <h6><em>assignment</em> Project Status</h6>
                    <p>Mobile Template</p>
                    <div class="progress">
                        <div class="progress-bar" role="progressbar" style="width: 55%;"></div>
                    </div>
                    <p>Backend API</p>
                    <div class="progress">
                        <div class="progress-bar" role="progressbar" style="width: 66%;"></div>
                    </div>
                </div>
            </div>
        </div>
    </user-profile-component>
</template>

<script>
    import UserProfileComponent from "../../../../utils/components/UserProfileComponent";
    export default {
        name: "AdminProfileComponent",
        components: {UserProfileComponent},
    }
</script>

<style scoped>
    .progress {
        height: 8px;
        margin-bottom: 10px;
    }
    .progress-bar {
        background-color: #3f50f6;
    }
</style>