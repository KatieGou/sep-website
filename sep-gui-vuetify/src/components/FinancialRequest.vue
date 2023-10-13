<template>
  <div>
    <h2>Financial Request</h2>
    <v-btn @click="newRequest">new recruitment request</v-btn>
    <v-dialog v-model="showDialog" width="600px">
      <v-card>
        <v-card-title>
          <span class="center">Financial Request</span>
        </v-card-title>
        <v-card-text>
          <v-container>
            <v-col>
              <v-row>
                <div>Requesting department</div>
                <v-radio-group>
                  <v-radio v-for="(department, index) in departments" :key="index" :label="department"
                    :value="department"></v-radio>
                </v-radio-group>
              </v-row>
              <v-row>
                <div>Project reference</div>
                <v-text-field required clearable></v-text-field>
              </v-row>
              <v-row>
                <div>Required Amount</div>
                <v-text-field required clearable></v-text-field>
              </v-row>
              <v-row>
                <div>Reason</div>
                <v-textarea required clearable></v-textarea>
              </v-row>
            </v-col>
          </v-container>
        </v-card-text>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      showDialog: false,
      departments: ['Administration',  'Services', 'Production', 'Financial'],
    };
  },
  methods: {
    newRequest() {
      this.showDialog = true;
    },
  }
}
</script>