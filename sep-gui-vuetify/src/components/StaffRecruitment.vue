<template>
  <div>
    <h2>Recruitment Request</h2>
    <v-btn @click="newRequest">new request</v-btn>
    <v-dialog v-model="showDialog" width="600px">
      <v-card>
        <v-card-title>
          <span class="center">Recruitment Request</span>
        </v-card-title>
        <v-card-text>
          <v-container>
            <v-col>
              <v-row>
                <div>Contract type</div>
                <v-radio-group>
                  <v-radio v-for="(type, index) in contractType" :key="index" :label="type"
                    :value="type"></v-radio>
                </v-radio-group>
              </v-row>
              <v-row>
                <div>Requesting department</div>
                <v-radio-group>
                  <v-radio v-for="(department, index) in departments" :key="index" :label="department"
                    :value="department"></v-radio>
                </v-radio-group>
              </v-row>
              <v-row>
                <div>Years of experience</div>
                <v-select
                  :items="experience"
                  single
                  required
                ></v-select>
              </v-row>
              <v-row>
                <div>Job title</div>
                <v-text-field required clearable></v-text-field>
              </v-row>
              <v-row>
                <div>Job description</div>
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
      contractType: ['Full Time', 'Part Time'],
      departments: ['Administration',  'Services', 'Production', 'Financial'],
      experience: ['0', '>0, <=1', '>1, <=3', '>3, <=5', '>5, <=10', '>10'],
    };
  },
  methods: {
    newRequest() {
      this.showDialog = true;
    },
  }
}
</script>