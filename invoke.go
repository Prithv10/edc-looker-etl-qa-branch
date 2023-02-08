package main
import (
        "fmt"
        "log"
        "net/http"
        "os"
        "os/exec"
)
func handler(w http.ResponseWriter, r *http.Request) {
        queryParams := r.URL.Query()
actionParam := queryParams.Get("action")
orgIdParam := queryParams.Get("orgId")
reportParam := queryParams.Get("report")
        log.Print("dbt: received a request")
cmd := exec.Command("/bin/sh", "script.sh", actionParam, orgIdParam, reportParam)
        cmd.Stdout = os.Stdout
 cmd.Stderr = os.Stderr
 err := cmd.Run()
 if err != nil {
  log.Fatalf("cmd.Run() failed with %s\n", err)
 }
}
func main() {
        log.Print("dbt: starting server...")
http.HandleFunc("/", handler)
port := os.Getenv("PORT")
        if port == "" {
                port = "8080"
        }
log.Printf("dbt: listening on %s", port)
        log.Fatal(http.ListenAndServe(fmt.Sprintf(":%s", port), nil))
}

